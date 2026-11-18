/* Live fleet state from the backend. Simulation is intentionally gone. */

import { fetchBootstrap, fetchState } from './api.js';

const channels = new Map();
let pollTimer = 0;

export const state = {
  settings: {},
  boxes: [],
  services: [],
  scenes: [],
  jobs: [],
  metrics: [],
  power: { idle: 7, active: 34, ceiling: 260 },
  history: new Map(),
  watts: 0,
  stats: { boxes: 0, online: 0, threads: 0, memoryGb: 0, watts: 0 },
  ready: false,
};

export function on(channel, handler) {
  if (!channels.has(channel)) channels.set(channel, new Set());
  channels.get(channel).add(handler);
  return () => channels.get(channel).delete(handler);
}

export function emit(channel, payload) {
  const handlers = channels.get(channel);
  if (!handlers) return;
  for (const handler of handlers) handler(payload);
}

export const getBox = (id) =>
  state.boxes.find((box) => box.id === id || box.name === id);

export const getService = (id) =>
  state.services.find((service) => service.id === id
    || service.name?.toLowerCase() === String(id).toLowerCase());

export const isAwake = (box) => box.status === 'online' || box.status === 'busy';

export const onlineBoxes = () => state.boxes.filter((box) => box.status === 'online');

export function applySnapshot(snapshot) {
  if (snapshot.boxes) state.boxes = snapshot.boxes;
  if (snapshot.services) state.services = snapshot.services.map((s) => ({ ...s, pending: false }));
  if (snapshot.watts != null) state.watts = snapshot.watts;
  if (snapshot.stats) state.stats = snapshot.stats;

  if (snapshot.history) {
    for (const [key, series] of Object.entries(snapshot.history)) {
      state.history.set(key, series);
    }
  }

  emit('tick', state);
  emit('stats', state.stats);
}

export function applyBootstrap(data) {
  state.settings = data.settings || {};
  state.boxes = data.boxes || [];
  state.services = (data.services || []).map((s) => ({ ...s, pending: false }));
  state.scenes = data.scenes || [];
  state.jobs = data.jobs || [];
  state.metrics = data.metrics || [];
  state.power = data.power || state.power;
  state.watts = data.watts || 0;
  state.stats = data.stats || state.stats;
  state.history = new Map(
    Object.entries(data.history || {}).map(([key, series]) => [key, series]),
  );
  state.ready = true;
  emit('bootstrap', state);
  emit('tick', state);
  emit('stats', state.stats);
}

export function patchBox(box) {
  const index = state.boxes.findIndex((b) => b.id === box.id);
  if (index === -1) return;
  state.boxes[index] = box;
  emit('box', box);
}

export function setBoxStatus(id, status) {
  const box = getBox(id);
  if (!box) return null;
  box.status = status;
  emit('box', box);
  return box;
}

export function setServicePending(id, pending) {
  const service = getService(id);
  if (!service) return null;
  service.pending = pending;
  emit('service', service);
  return service;
}

export function setServiceRunning(id, running) {
  const service = getService(id);
  if (!service) return null;
  service.running = running;
  service.pending = false;
  emit('service', service);
  return service;
}

export async function initBackend() {
  const data = await fetchBootstrap();
  applyBootstrap(data);
}

export function startPolling(intervalMs = 2000) {
  stopPolling();
  pollTimer = setInterval(async () => {
    try {
      const snap = await fetchState();
      applySnapshot(snap);
    } catch {
      /* server unreachable — leave last state */
    }
  }, intervalMs);
}

export function stopPolling() {
  if (pollTimer) clearInterval(pollTimer);
  pollTimer = 0;
}