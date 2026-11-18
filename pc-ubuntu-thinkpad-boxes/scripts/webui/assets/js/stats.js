import { on, state } from './store.js';
import { $ } from './utils.js';

export function initStats() {
  const paint = (stats) => {
    const map = {
      statBoxes: stats.boxes,
      statOnline: stats.online,
      statThreads: stats.threads,
      statMemory: stats.memoryGb,
    };
    for (const [id, value] of Object.entries(map)) {
      const el = $(`#${id}`);
      if (el) el.textContent = String(Math.round(value * 10) / 10);
    }
    const onlineEl = $('#statOnlineSuffix');
    if (onlineEl) onlineEl.textContent = stats.boxes > 0 ? `/${stats.boxes}` : '/0';
    const watts = $('#statWatts');
    if (watts) watts.textContent = String(Math.round(stats.watts ?? state.watts ?? 0));
    const services = $('#statServices');
    if (services) services.textContent = String(state.services?.length ?? 0);
  };

  on('stats', paint);
  on('tick', () => paint(state.stats));
}