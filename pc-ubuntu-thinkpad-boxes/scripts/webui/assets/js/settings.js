/* 3D settings sheet — opens from the hero clock. */

import {
  discoverHosts, enrollHost, fetchBootstrap, removeHost, saveSettings,
} from './api.js';
import { applyBootstrap } from './store.js';
import { refreshFleet } from './fleet.js';
import { $, escapeHtml } from './utils.js';
import { toast } from './toast.js';

function setHidden(node, hidden) {
  if (!node) return;
  node.hidden = hidden;
  node.setAttribute('aria-hidden', hidden ? 'true' : 'false');
}

export function initSettings() {
  const backdrop = $('#settingsBackdrop');
  const panel = $('#settingsPanel');
  const form = $('#settingsForm');
  const discoverBtn = $('#settingsDiscover');
  const manualForm = $('#settingsManualForm');
  const results = $('#settingsDiscoverResults');
  const enrolled = $('#settingsEnrolled');
  const closeBtn = $('#settingsClose');

  if (!backdrop || !panel) return { open, close };

  const fields = {
    subnet: $('#settingsSubnet'),
    probePort: $('#settingsProbePort'),
    sshUser: $('#settingsSshUser'),
    wolBroadcast: $('#settingsWolBroadcast'),
    agentPort: $('#settingsAgentPort'),
    manualName: $('#settingsManualName'),
    manualIp: $('#settingsManualIp'),
    manualMac: $('#settingsManualMac'),
  };

  function open() {
    loadEnrolled();
    setHidden(backdrop, false);
    requestAnimationFrame(() => backdrop.classList.add('is-open'));
    panel.focus();
    document.body.classList.add('settings-open');
  }

  function close() {
    backdrop.classList.remove('is-open');
    document.body.classList.remove('settings-open');
    window.setTimeout(() => setHidden(backdrop, true), 320);
  }

  async function reloadFleetState() {
    const data = await fetchBootstrap();
    applyBootstrap(data);
    paintEnrolled(data.boxes || []);
    refreshFleet();
  }

  async function loadEnrolled() {
    try {
      const data = await fetchBootstrap();
      applyBootstrap(data);
      const s = data.settings || {};
      fields.subnet.value = s.subnet || '';
      fields.probePort.value = s.probe_port ?? 22;
      fields.sshUser.value = s.ssh_user || '';
      fields.wolBroadcast.value = s.wol_broadcast || '255.255.255.255';
      fields.agentPort.value = s.agent_port ?? 8421;
      paintEnrolled(data.boxes || []);
      refreshFleet();
    } catch (error) {
      toast('Settings', error.message, 'err');
    }
  }

  function paintEnrolled(boxes) {
    if (!enrolled) return;
    if (boxes.length === 0) {
      enrolled.innerHTML = '<p class="settings__empty">No hosts enrolled yet. Scan the LAN or add one manually.</p>';
      return;
    }
    enrolled.innerHTML = boxes.map((box) => `
      <div class="settings__host">
        <div>
          <strong>${escapeHtml(box.name)}</strong>
          <span class="settings__host-meta">${escapeHtml(box.ip)} · ${escapeHtml(box.status)}</span>
        </div>
        <button type="button" class="chip chip--danger" data-remove="${escapeHtml(box.id)}">Remove</button>
      </div>`).join('');
  }

  form?.addEventListener('submit', async (event) => {
    event.preventDefault();
    try {
      await saveSettings({
        subnet: fields.subnet.value.trim(),
        probe_port: Number(fields.probePort.value),
        ssh_user: fields.sshUser.value.trim(),
        wol_broadcast: fields.wolBroadcast.value.trim(),
        agent_port: Number(fields.agentPort.value),
      });
      toast('Settings saved', 'Network preferences updated', 'ok');
    } catch (error) {
      toast('Settings', error.message, 'err');
    }
  });

  discoverBtn?.addEventListener('click', async () => {
    discoverBtn.disabled = true;
    results.innerHTML = '<p class="settings__scanning">Scanning LAN…</p>';
    try {
      const subnet = fields.subnet.value.trim();
      const { hosts } = await discoverHosts(subnet);
      if (!hosts?.length) {
        results.innerHTML = '<p class="settings__empty">No reachable hosts on that subnet at the probe port.</p>';
        return;
      }
      results.innerHTML = hosts.map((host) => `
        <div class="settings__found">
          <div>
            <strong>${escapeHtml(host.ip)}</strong>
            <span class="settings__host-meta">${escapeHtml(host.hostname || 'unknown host')}</span>
          </div>
          <button type="button" class="chip chip--go" data-connect="${escapeHtml(host.ip)}"
                  data-name="${escapeHtml(host.hostname || `box-${host.ip.replace(/\./g, '-')}`)}">
            Connect
          </button>
        </div>`).join('');
    } catch (error) {
      results.innerHTML = `<p class="settings__empty">${escapeHtml(error.message)}</p>`;
    } finally {
      discoverBtn.disabled = false;
    }
  });

  results?.addEventListener('click', async (event) => {
    const button = event.target.closest('[data-connect]');
    if (!button) return;
    const ip = button.dataset.connect;
    const name = button.dataset.name;
    button.disabled = true;
    try {
      await enrollHost({ ip, name, mac: fields.manualMac?.value?.trim() || '' });
      toast('Host connected', `${name} enrolled at ${ip}`, 'ok');
      await reloadFleetState();
    } catch (error) {
      toast('Connect failed', error.message, 'err');
      button.disabled = false;
    }
  });

  manualForm?.addEventListener('submit', async (event) => {
    event.preventDefault();
    try {
      await enrollHost({
        name: fields.manualName.value.trim(),
        ip: fields.manualIp.value.trim(),
        mac: fields.manualMac.value.trim(),
      });
      toast('Host added', fields.manualIp.value.trim(), 'ok');
      fields.manualName.value = '';
      fields.manualIp.value = '';
      fields.manualMac.value = '';
      await reloadFleetState();
    } catch (error) {
      toast('Add failed', error.message, 'err');
    }
  });

  enrolled?.addEventListener('click', async (event) => {
    const button = event.target.closest('[data-remove]');
    if (!button) return;
    try {
      await removeHost(button.dataset.remove);
      toast('Host removed', button.dataset.remove, 'warn');
      await reloadFleetState();
    } catch (error) {
      toast('Remove failed', error.message, 'err');
    }
  });

  closeBtn?.addEventListener('click', close);
  backdrop.addEventListener('click', (event) => {
    if (event.target === backdrop) close();
  });
  window.addEventListener('keydown', (event) => {
    if (event.key === 'Escape' && backdrop.classList.contains('is-open')) close();
  });

  return { open, close };
}