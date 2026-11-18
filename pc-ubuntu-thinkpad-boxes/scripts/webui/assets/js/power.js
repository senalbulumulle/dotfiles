/* Power scenes and the live draw meter.

   Scenes are destructive, so they arm on a press-and-hold rather than a click.
   Keyboard users hold Enter or Space; the auto-repeat keydown keeps the timer
   alive exactly like a held pointer. */

import { on, state } from './store.js';
import { rollingReboot, runBatch } from './actions.js';
import { $, clamp, escapeHtml } from './utils.js';
import { toast } from './toast.js';

const HOLD_MS = 900;
const RUNNERS = {
  'all-hands': async () => {
    const woken = await runBatch(state.boxes, 'wake', { stagger: 260 });
    return woken > 0
      ? { title: 'All hands', text: `${woken} box${woken === 1 ? '' : 'es'} brought online`, tone: 'ok' }
      : { title: 'All hands', text: 'Every box was already awake', tone: 'info' };
  },

  'night-watch': async () => {
    const targets = state.boxes.filter((box) => box.status === 'online');
    const slept = await runBatch(targets, 'sleep', { stagger: 180 });
    return slept > 0
      ? { title: 'Night watch', text: `${slept} host${slept === 1 ? '' : 's'} sent suspend`, tone: 'ok' }
      : { title: 'Night watch', text: 'Nothing left to suspend', tone: 'info' };
  },

  'rolling-reboot': async () => {
    const count = await rollingReboot();
    return count > 0
      ? { title: 'Rolling reboot', text: `${count} box${count === 1 ? '' : 'es'} cycled`, tone: 'ok' }
      : { title: 'Rolling reboot', text: 'No online boxes to cycle', tone: 'warn' };
  },

  hibernate: async () => {
    const targets = state.boxes.filter((box) => box.status === 'online');
    const slept = await runBatch(targets, 'sleep', { stagger: 150 });
    return slept > 0
      ? { title: 'Fleet hibernating', text: `${slept} host${slept === 1 ? '' : 's'} sent suspend`, tone: 'warn' }
      : { title: 'Fleet hibernating', text: 'The rack is already down', tone: 'info' };
  },
};

function sceneMarkup(scene) {
  return `
      <button class="scene surface reveal" type="button" data-scene="${escapeHtml(scene.id)}">
        <span class="scene__icon" aria-hidden="true">
          <svg viewBox="0 0 24 24" width="19" height="19" fill="none" stroke="currentColor"
               stroke-width="1.7" stroke-linecap="round" stroke-linejoin="round">
            <path d="${escapeHtml(scene.icon)}"/>
          </svg>
        </span>
        <span class="scene__name">${escapeHtml(scene.name)}</span>
        <span class="scene__desc">${escapeHtml(scene.desc)}</span>
        <span class="scene__hint">${escapeHtml(scene.hint)}</span>
        <span class="scene__hold" aria-hidden="true"></span>
      </button>`;
}

/** Wire press-and-hold arming onto one scene button. */
function attachHold(button, run) {
  let timer = 0;
  let holding = false;

  const stop = () => {
    clearTimeout(timer);
    timer = 0;
    holding = false;
    button.classList.remove('is-holding');
  };

  const start = () => {
    if (holding || button.disabled) return;
    holding = true;
    button.classList.add('is-holding');
    timer = setTimeout(() => {
      stop();
      run();
    }, HOLD_MS);
  };

  button.addEventListener('pointerdown', (event) => {
    event.preventDefault();
    start();
  });
  button.addEventListener('pointerup', stop);
  button.addEventListener('pointerleave', stop);
  button.addEventListener('pointercancel', stop);
  button.addEventListener('blur', stop);

  button.addEventListener('keydown', (event) => {
    if (event.key !== 'Enter' && event.key !== ' ') return;
    event.preventDefault(); // also stops Space from scrolling the page
    start();
  });
  button.addEventListener('keyup', (event) => {
    if (event.key === 'Enter' || event.key === ' ') stop();
  });

  // Activation is owned entirely by the hold timer.
  button.addEventListener('click', (event) => event.preventDefault());
}

function initScenes() {
  const grid = $('#sceneGrid');
  if (!grid) return;

  const scenes = state.scenes || [];
  if (scenes.length === 0) {
    grid.innerHTML = '<p class="placeholder">No power scenes configured.</p>';
    return;
  }

  grid.innerHTML = scenes.map(sceneMarkup).join('');

  for (const scene of scenes) {
    const button = grid.querySelector(`[data-scene="${scene.id}"]`);
    const runner = RUNNERS[scene.id];
    if (!button || !runner) continue;

    button.setAttribute('aria-label', `${scene.name}. ${scene.desc} Press and hold to arm.`);

    attachHold(button, async () => {
      button.disabled = true;
      toast(`${scene.name} armed`, 'Running across the fleet…', 'info');

      try {
        const result = await runner();
        toast(result.title, result.text, result.tone);
      } finally {
        button.disabled = false;
      }
    });
  }
}

function initMeter() {
  const fill = $('#powerFill');
  const value = $('#powerWatts');
  if (!fill || !value) return;

  const paint = () => {
    const watts = state.watts;
    const ceiling = state.power?.ceiling || 260;
    fill.style.width = `${clamp((watts / ceiling) * 100, 0, 100).toFixed(1)}%`;
    value.textContent = String(Math.round(watts));
  };

  paint();
  on('tick', paint);
}

export function initPower() {
  initScenes();
  initMeter();
}
