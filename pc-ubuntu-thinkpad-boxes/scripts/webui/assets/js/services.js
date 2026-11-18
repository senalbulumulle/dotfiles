/* Service rows with start/stop switches. */

import { toggleService } from './actions.js';
import { getBox, on, state } from './store.js';
import { $, escapeHtml } from './utils.js';

function rowMarkup(service) {
  const host = getBox(service.host);

  return `
      <div class="service surface reveal" data-service="${escapeHtml(service.id)}">
        <span class="service__glyph" aria-hidden="true">${escapeHtml(service.mark)}</span>
        <span class="service__ident">
          <span class="service__name">${escapeHtml(service.name)}</span>
          <span class="service__desc">${escapeHtml(service.desc)}</span>
        </span>
        <span class="service__host">on <b>${escapeHtml(host ? host.name : service.host)}</b></span>
        <span class="service__port">:${service.port}</span>
        <button class="switch" type="button" role="switch" aria-checked="false"></button>
      </div>`;
}

export function initServices() {
  const list = $('#serviceList');
  if (!list) return;

  if (!state.services.length) {
    list.innerHTML = '<p class="placeholder">No services registered on the backend yet.</p>';
    return;
  }

  list.innerHTML = state.services.map(rowMarkup).join('');

  const rows = new Map();

  for (const service of state.services) {
    const row = list.querySelector(`[data-service="${service.id}"]`);
    if (row) rows.set(service.id, { row, toggle: row.querySelector('.switch') });
  }

  function paint(service) {
    const refs = rows.get(service.id);
    if (!refs) return;

    refs.toggle.setAttribute('aria-checked', String(service.running));
    refs.toggle.disabled = Boolean(service.pending);

    const verb = service.pending ? 'changing state' : service.running ? 'running' : 'stopped';
    refs.toggle.setAttribute('aria-label', `${service.name} — ${verb}. Toggle to ${service.running ? 'stop' : 'start'}.`);
  }

  list.addEventListener('click', (event) => {
    const toggle = event.target.closest('.switch');
    if (!toggle || toggle.disabled) return;

    const id = toggle.closest('[data-service]')?.dataset.service;
    if (id) toggleService(id);
  });

  state.services.forEach(paint);
  on('service', paint);
}
