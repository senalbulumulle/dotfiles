/* Pointer-driven depth on every `.surface` tile — fleet cards, scenes, and panels. */

import { motion } from './utils.js';

const DEFAULT = { tilt: 5, lift: -6 };

export function attachSurface(element, options = {}) {
  if (!element || motion.reduced) return;

  const { tilt, lift } = { ...DEFAULT, ...options };

  const onMove = (event) => {
    const rect = element.getBoundingClientRect();
    const px = (event.clientX - rect.left) / rect.width;
    const py = (event.clientY - rect.top) / rect.height;

    element.style.setProperty('--mx', `${(px * 100).toFixed(1)}%`);
    element.style.setProperty('--my', `${(py * 100).toFixed(1)}%`);
    element.style.transform =
      `perspective(920px) rotateX(${((0.5 - py) * tilt).toFixed(2)}deg) ` +
      `rotateY(${((px - 0.5) * tilt).toFixed(2)}deg) translateY(${lift}px)`;
  };

  const engage = (event) => {
    if (event.pointerType === 'touch') {
      element.classList.add('is-pressed');
      return;
    }
    element.classList.add('is-active');
    onMove(event);
  };

  const release = () => {
    element.classList.remove('is-active', 'is-pressed');
    element.style.transform = '';
  };

  element.addEventListener('pointerenter', engage);
  element.addEventListener('pointermove', (event) => {
    if (event.pointerType === 'touch' || !element.classList.contains('is-active')) return;
    onMove(event);
  });
  element.addEventListener('pointerleave', release);
  element.addEventListener('pointercancel', release);
  element.addEventListener('pointerdown', () => element.classList.add('is-pressed'));
  element.addEventListener('pointerup', () => element.classList.remove('is-pressed'));
}

const PRESETS = [
  ['.box', { tilt: 7, lift: -10 }],
  ['.scene', { tilt: 4, lift: -6 }],
  ['.service', { tilt: 3, lift: -3 }],
  ['.job', { tilt: 3, lift: -4 }],
  ['.stat.surface', { tilt: 3, lift: -5 }],
  ['.powerbar.surface', { tilt: 2.5, lift: -4 }],
];

/** Wire every rendered surface tile. Safe to call again after dynamic markup. */
export function initSurfaces(root = document) {
  if (motion.reduced) return;

  for (const [selector, options] of PRESETS) {
    for (const element of root.querySelectorAll(selector)) {
      if (element.dataset.surfaceBound) continue;
      element.dataset.surfaceBound = '1';
      attachSurface(element, options);
    }
  }
}