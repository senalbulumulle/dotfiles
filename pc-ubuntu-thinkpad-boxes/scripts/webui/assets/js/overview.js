/* Overview band: live stats when a ThinkPad is online, otherwise a connect prompt. */

import { discoverHosts, enrollHost, fetchBootstrap } from './api.js';
import { refreshFleet } from './fleet.js';
import { applyBootstrap, on, state } from './store.js';
import { toast } from './toast.js';
import { $, escapeHtml } from './utils.js';

function isConnected() {
  return state.boxes.some((box) => box.status === 'online' || box.status === 'busy');
}

function hostName(host) {
  const hostname = (host.hostname || '').trim();
  if (hostname) return hostname;
  return `thinkpad-${String(host.ip).replace(/\./g, '-')}`;
}

export function initOverview() {
  const stats = $('#statsGrid');
  const prompt = $('#connectRequired');
  const results = $('#lanResults');
  const search = $('#lanSearch');
  if (!stats || !prompt || !results || !search) return;

  const paint = () => {
    const connected = isConnected();
    stats.hidden = !connected;
    prompt.hidden = connected;
  };

  async function reload() {
    const data = await fetchBootstrap();
    applyBootstrap(data);
    refreshFleet();
    paint();
  }

  search.addEventListener('click', async () => {
    const subnet = (state.settings?.subnet || '').trim();
    results.hidden = false;

    if (!subnet) {
      results.innerHTML = '<p class="connect-required__status">Set a subnet in Settings before searching the local network.</p>';
      return;
    }

    search.disabled = true;
    search.setAttribute('aria-busy', 'true');
    results.innerHTML = '<p class="connect-required__status">Searching the local network…</p>';

    try {
      const { hosts } = await discoverHosts(subnet);
      const found = Array.isArray(hosts) ? hosts : [];
      if (found.length === 0) {
        results.innerHTML = '<p class="connect-required__status">No configured ThinkPad devices found on the local network.</p>';
        return;
      }

      const enrolled = new Set(state.boxes.map((box) => box.ip));
      results.innerHTML = found.map((host) => {
        const name = hostName(host);
        const already = enrolled.has(host.ip);
        const action = already
          ? '<span class="chip" aria-disabled="true">Enrolled</span>'
          : `<button class="chip chip--go" type="button" data-connect="${escapeHtml(host.ip)}" data-name="${escapeHtml(name)}">Connect</button>`;
        return `
          <div class="connect-required__host">
            <div>
              <strong>${escapeHtml(name)}</strong>
              <span>${escapeHtml(host.ip)}</span>
            </div>
            ${action}
          </div>`;
      }).join('');
    } catch (error) {
      results.innerHTML = `<p class="connect-required__status">${escapeHtml(error.message)}</p>`;
    } finally {
      search.disabled = false;
      search.removeAttribute('aria-busy');
    }
  });

  results.addEventListener('click', async (event) => {
    const button = event.target.closest('[data-connect]');
    if (!button) return;
    const ip = button.dataset.connect;
    const name = button.dataset.name || hostName({ ip });
    button.disabled = true;
    try {
      await enrollHost({ ip, name });
      toast('Host connected', `${name} enrolled at ${ip}`, 'ok');
      await reload();
    } catch (error) {
      toast('Connect failed', error.message, 'err');
      button.disabled = false;
    }
  });

  on('tick', paint);
  on('bootstrap', paint);
  paint();
}
