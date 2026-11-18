/* OS shell chrome: status-bar scroll depth and pointer spotlight. */

import { $, clamp, lerp, motion } from './utils.js';
import { onFrame } from './ticker.js';

function initDepth() {
  const depth = $('#statusbarScroll');
  if (!depth) return;

  let last = -1;

  onFrame(() => {
    const scrollable = document.documentElement.scrollHeight - window.innerHeight;
    const ratio = scrollable > 0 ? clamp(window.scrollY / scrollable, 0, 1) : 0;
    const rounded = Math.round(ratio * 1000);

    if (rounded === last) return;
    last = rounded;
    depth.textContent = `deck depth ${(ratio * 100).toFixed(0)}%`;
  });
}

function initSpotlight() {
  const spotlight = $('#spotlight');
  if (!spotlight || motion.reduced) return;

  const position = { x: window.innerWidth / 2, y: window.innerHeight / 2 };
  const target = { ...position };
  let active = false;

  window.addEventListener('pointermove', (event) => {
    if (event.pointerType === 'touch') return;
    target.x = event.clientX;
    target.y = event.clientY;

    if (!active) {
      active = true;
      spotlight.classList.add('is-active');
    }
  }, { passive: true });

  document.addEventListener('pointerleave', () => {
    active = false;
    spotlight.classList.remove('is-active');
  });

  onFrame(() => {
    if (!active) return;
    position.x = lerp(position.x, target.x, 0.12);
    position.y = lerp(position.y, target.y, 0.12);
    spotlight.style.transform = `translate3d(${position.x.toFixed(1)}px, ${position.y.toFixed(1)}px, 0)`;
  });
}

export function initChrome() {
  initDepth();
  initSpotlight();
}