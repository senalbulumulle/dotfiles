/* Fleet actions — every mutation goes through the API. */

import { runBoxAction, toggleService as apiToggleService } from './api.js';
import {
  emit, getBox, getService, patchBox,
  setBoxStatus, setServicePending, setServiceRunning, state,
} from './store.js';
import { toast } from './toast.js';

const PLAN = {
  wake: {
    label: 'Wake', progressive: 'Waking', allowed: ['offline', 'sleep'], tone: 'ok',
    blocked: 'is already awake',
  },
  sleep: {
    label: 'Suspend', progressive: 'Suspending', allowed: ['online'], tone: 'info',
    blocked: 'is not online',
  },
  reboot: {
    label: 'Reboot', progressive: 'Rebooting', allowed: ['online'], tone: 'ok',
    blocked: 'is not online',
  },
  shutdown: {
    label: 'Shut down', progressive: 'Shutting down', allowed: ['online'], tone: 'warn',
    blocked: 'is not online',
  },
};

export const ACTIONS = Object.keys(PLAN);

export const canRun = (box, action) =>
  Boolean(box) && Boolean(PLAN[action]) && PLAN[action].allowed.includes(box.status);

export async function runAction(id, action, { quiet = false } = {}) {
  const box = getBox(id);
  const plan = PLAN[action];

  if (!box) return { ok: false, message: `unknown box "${id}"` };
  if (!plan) return { ok: false, message: `unknown action "${action}"` };
  if (box.status === 'busy') {
    return { ok: false, message: `${box.name} is already mid-operation` };
  }
  if (!canRun(box, action)) {
    return { ok: false, message: `${box.name} ${plan.blocked}` };
  }

  const previous = box.status;
  setBoxStatus(box.id, 'busy');
  if (!quiet) toast(`${plan.progressive} ${box.name}`, box.ip, 'info');

  try {
    const updated = await runBoxAction(box.id, action);
    patchBox(updated);
    const message = `${box.name} is now ${updated.status}`;
    if (!quiet) toast(`${plan.label} complete`, message, plan.tone);
    return { ok: true, message };
  } catch (error) {
    setBoxStatus(box.id, previous);
    const message = error.message || 'action failed';
    if (!quiet) toast(`${plan.label} failed`, message, 'err');
    return { ok: false, message };
  }
}

export async function runBatch(boxes, action, { stagger = 0 } = {}) {
  let count = 0;
  for (const box of boxes) {
    if (!canRun(box, action)) continue;
    const result = await runAction(box.id, action, { quiet: true });
    if (result.ok) count += 1;
    if (stagger > 0) await new Promise((r) => setTimeout(r, stagger));
  }
  return count;
}

export async function rollingReboot() {
  const queue = state.boxes.filter((box) => box.status === 'online');
  let done = 0;
  for (const box of queue) {
    const result = await runAction(box.id, 'reboot', { quiet: true });
    if (result.ok) {
      done += 1;
      toast('Rolling reboot', `${box.name} cycled (${done}/${queue.length})`, 'ok');
    }
  }
  return done;
}

export async function toggleService(id, next) {
  const service = getService(id);
  if (!service) return { ok: false, message: `unknown service "${id}"` };
  if (service.pending) return { ok: false, message: `${service.name} is already changing state` };

  const host = getBox(service.host);
  const running = next ?? !service.running;

  if (running && host && host.status !== 'online') {
    toast('Host unavailable', `${host.name} must be online`, 'err');
    return { ok: false, message: `${host.name} is ${host.status}` };
  }

  setServicePending(service.id, true);
  try {
    const updated = await apiToggleService(service.id, running);
    setServiceRunning(service.id, updated.running);
    const message = `${service.name} ${updated.running ? 'started' : 'stopped'}`;
    toast(updated.running ? 'Unit started' : 'Unit stopped', message, updated.running ? 'ok' : 'warn');
    return { ok: true, message };
  } catch (error) {
    service.pending = false;
    emit('service', service);
    const message = error.message || 'toggle failed';
    toast('Service error', message, 'err');
    return { ok: false, message };
  }
}