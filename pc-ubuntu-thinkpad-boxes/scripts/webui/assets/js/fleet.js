/* The box cards: rendered from live backend state. */

import { ACTIONS, canRun, runAction } from './actions.js';
import { on, state } from './store.js';
import { initSurfaces } from './surfaces.js';
import { $, clamp, escapeHtml, formatUptime } from './utils.js';
import { toast } from './toast.js';

const STATUS_LABEL = {
  online: 'online',
  offline: 'offline',
  sleep: 'suspended',
  busy: 'working',
};

const STATUS_CLASS = {
  online: 'status--online',
  offline: 'status--offline',
  sleep: 'status--sleep',
  busy: 'status--busy',
};

const BUTTONS = [
  { action: 'wake', label: 'Wake', variant: 'chip--go' },
  { action: 'reboot', label: 'Reboot', variant: '' },
  { action: 'sleep', label: 'Suspend', variant: '' },
  { action: 'shutdown', label: 'Shut down', variant: 'chip--danger' },
];

const GAUGES = [
  { key: 'cpu', label: 'cpu', unit: '%', hotAt: 85 },
  { key: 'ram', label: 'ram', unit: '%', hotAt: 90 },
  { key: 'temp', label: 'temp', unit: '°C', hotAt: 80 },
];

let cards = new Map();
let wired = false;

function cardMarkup(box) {
  const gauges = GAUGES.map((gauge) => `
        <div class="gauge" data-gauge="${gauge.key}">
          <span class="gauge__label">${gauge.label}</span>
          <span class="gauge__track"><span class="gauge__fill"></span></span>
          <span class="gauge__value">—</span>
        </div>`).join('');

  const buttons = BUTTONS.map((button) => `
        <button class="chip ${button.variant}" type="button" data-action="${button.action}">
          ${button.label}
        </button>`).join('');

  return `
      <article class="box surface reveal" data-box="${escapeHtml(box.id)}">
        <div class="box__top">
          <div class="box__ident">
            <span class="box__name">${escapeHtml(box.name)}</span>
            <span class="box__model">${escapeHtml(box.model)} · ${escapeHtml(box.cpu)}</span>
          </div>
          <span class="status" data-status>
            <span class="status__dot"></span><span data-status-text>—</span>
          </span>
        </div>

        <span class="box__role">${escapeHtml(box.role)}</span>

        <div class="box__specs">
          <span>${box.threads} threads</span>
          <span>${box.ramGb} GB</span>
          <span>${escapeHtml(box.storage)}</span>
          <span>${escapeHtml(box.ip)}</span>
          <span data-uptime>up —</span>
        </div>

        <div class="gauges">${gauges}</div>

        <div class="box__actions">
          ${buttons}
          <button class="chip" type="button" data-action="ssh">Copy SSH</button>
        </div>
      </article>`;
}

function paintFleetGrid(grid) {
  if (!grid) return;
  if (state.boxes.length === 0) {
    grid.innerHTML = `
      <div class="empty-deck reveal is-visible">
        <p>No hosts enrolled.</p>
        <p class="empty-deck__hint">Use the search button on the panel above to find configured ThinkPad devices on the local network.</p>
      </div>`;
    cards = new Map();
    return;
  }
  grid.innerHTML = state.boxes.map(cardMarkup).join('');
}

function rebuildCardRefs(grid) {
  cards = new Map();
  for (const box of state.boxes) {
    const card = grid.querySelector(`[data-box="${box.id}"]`);
    if (!card) continue;
    cards.set(box.id, {
      card,
      status: card.querySelector('[data-status]'),
      statusText: card.querySelector('[data-status-text]'),
      uptime: card.querySelector('[data-uptime]'),
      gauges: new Map(GAUGES.map((gauge) => {
        const row = card.querySelector(`[data-gauge="${gauge.key}"]`);
        return [gauge.key, {
          fill: row.querySelector('.gauge__fill'),
          value: row.querySelector('.gauge__value'),
          config: gauge,
        }];
      })),
      buttons: new Map(
        ACTIONS.map((action) => [action, card.querySelector(`[data-action="${action}"]`)]),
      ),
    });
  }
}

function paint(box) {
  const refs = cards.get(box.id);
  if (!refs) return;

  refs.status.className = `status ${STATUS_CLASS[box.status] ?? 'status--offline'}`;
  refs.statusText.textContent = STATUS_LABEL[box.status] ?? box.status;
  refs.card.classList.toggle('is-offline', box.status === 'offline');

  refs.uptime.textContent = box.status === 'online' || box.status === 'busy'
    ? `up ${formatUptime(box.bootedAt)}`
    : 'down';

  for (const [key, gauge] of refs.gauges) {
    const value = box.metrics?.[key] ?? 0;
    gauge.fill.style.width = `${clamp(value, 0, 100).toFixed(1)}%`;
    gauge.fill.classList.toggle('is-hot', value >= gauge.config.hotAt);
    gauge.value.textContent = `${Math.round(value)}${gauge.config.unit}`;
  }

  for (const [action, button] of refs.buttons) {
    if (button) button.disabled = !canRun(box, action);
  }
}

export function refreshFleet() {
  const grid = $('#fleetGrid');
  paintFleetGrid(grid);
  rebuildCardRefs(grid);
  initSurfaces(grid);
  state.boxes.forEach(paint);
}

export function initFleet() {
  const grid = $('#fleetGrid');
  if (!grid) return;

  if (!wired) {
    wired = true;
    grid.addEventListener('click', async (event) => {
      const button = event.target.closest('button[data-action]');
      if (!button) return;

      const card = button.closest('[data-box]');
      const box = state.boxes.find((candidate) => candidate.id === card?.dataset.box);
      if (!box) return;

      const action = button.dataset.action;
      if (action === 'ssh') {
        const user = state.settings?.ssh_user || 'senal';
        const command = `ssh ${user}@${box.ip}`;
        try {
          await navigator.clipboard.writeText(command);
          toast('Copied to clipboard', command, 'ok');
        } catch {
          toast('Copy blocked', command, 'warn');
        }
        return;
      }

      const result = await runAction(box.id, action);
      if (!result.ok) toast('Nothing to do', result.message, 'warn');
    });

    on('box', paint);
    on('tick', () => state.boxes.forEach(paint));
  }

  refreshFleet();
}