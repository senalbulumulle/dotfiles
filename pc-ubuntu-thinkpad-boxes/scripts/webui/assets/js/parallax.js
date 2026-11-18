/* Scroll- and pointer-driven parallax.

   Any element with data-speed drifts as it crosses the viewport: positive
   values lag behind the scroll (far away), negative values outrun it (close).
   data-mouse adds pointer sway in pixels at the screen edge.

   Offsets are measured once per resize and cached, so the per-frame work is a
   single transform write with no layout reads. */

import { $$, clamp, lerp, motion } from './utils.js';
import { onFrame } from './ticker.js';

const POINTER_EASE = 0.08;

export function initParallax() {
  if (motion.reduced) return;

  const items = $$('[data-speed], [data-mouse]').map((el) => ({
    el,
    speed: Number(el.dataset.speed ?? 0),
    mouse: Number(el.dataset.mouse ?? 0),
    fades: el.hasAttribute('data-hero-fade'),
    center: 0,
    lastTransform: '',
  }));

  if (items.length === 0) return;

  const pointer = { x: 0, y: 0, targetX: 0, targetY: 0 };
  let viewportHeight = window.innerHeight;

  function measure() {
    viewportHeight = window.innerHeight;

    for (const item of items) {
      // Clear the transform so the measurement is of the resting position.
      item.el.style.transform = '';
      item.lastTransform = '';
    }

    for (const item of items) {
      const rect = item.el.getBoundingClientRect();
      item.center = rect.top + window.scrollY + rect.height / 2;
    }
  }

  function render() {
    pointer.x = lerp(pointer.x, pointer.targetX, POINTER_EASE);
    pointer.y = lerp(pointer.y, pointer.targetY, POINTER_EASE);

    const scrollY = window.scrollY;

    for (const item of items) {
      // −1 when the element sits a viewport below the fold, +1 a viewport above.
      const progress = (scrollY + viewportHeight / 2 - item.center) / viewportHeight;

      const x = pointer.x * item.mouse;
      const y = progress * item.speed + pointer.y * item.mouse;

      let transform = `translate3d(${x.toFixed(2)}px, ${y.toFixed(2)}px, 0)`;

      if (item.fades) {
        const faded = clamp(scrollY / (viewportHeight * 0.8), 0, 1);
        transform += ` scale(${(1 - faded * 0.12).toFixed(3)})`;

        const opacity = String(Math.round((1 - faded ** 1.35) * 1000) / 1000);
        if (item.el.style.opacity !== opacity) item.el.style.opacity = opacity;
      }

      if (transform !== item.lastTransform) {
        item.el.style.transform = transform;
        item.lastTransform = transform;
      }
    }
  }

  window.addEventListener('pointermove', (event) => {
    if (event.pointerType === 'touch') return;
    pointer.targetX = (event.clientX / window.innerWidth) * 2 - 1;
    pointer.targetY = (event.clientY / window.innerHeight) * 2 - 1;
  }, { passive: true });

  window.addEventListener('resize', measure);
  window.addEventListener('orientationchange', measure);

  measure();
  // Fonts land after first paint and shift the layout underneath us.
  document.fonts?.ready.then(measure).catch(() => {});

  render();
  onFrame(render);
}
