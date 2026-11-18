/* Bootstrap — load the backend first, then render panels. */

import { initBackend, startPolling } from './store.js';
import { initClock } from './clock.js';
import { initStarfield } from './starfield.js';
import { initFleet } from './fleet.js';
import { initPower } from './power.js';
import { initServices } from './services.js';
import { initAutomation } from './automation.js';
import { initChrome } from './chrome.js';
import { initParallax } from './parallax.js';
import { initReveals, initCounters } from './reveal.js';
import { initSurfaces } from './surfaces.js';
import { initSettings } from './settings.js';
import { initStats } from './stats.js';
import { initOverview } from './overview.js';
import { $ } from './utils.js';
import { toast } from './toast.js';

async function boot() {
  try {
    await initBackend();
  } catch (error) {
    toast('Backend offline', 'Start ./serve.sh — APIs are required.', 'err');
  }

  initFleet();
  initPower();
  initServices();
  initAutomation();
  initSurfaces();
  initStats();
  initOverview();

  const settings = initSettings();
  initClock({ onOpenSettings: () => settings?.open?.() });

  initStarfield($('#starfield'));
  initChrome();
  initParallax();
  initReveals();
  initCounters();
  startPolling(2000);
}

if (document.readyState === 'loading') {
  document.addEventListener('DOMContentLoaded', () => { boot().catch(() => {}); }, { once: true });
} else {
  boot().catch(() => {});
}