/* Small shared helpers. */

export const $ = (selector, root = document) => root.querySelector(selector);
export const $$ = (selector, root = document) => Array.from(root.querySelectorAll(selector));

export const clamp = (value, min, max) => (value < min ? min : value > max ? max : value);
export const lerp = (a, b, t) => a + (b - a) * t;
export const rand = (min, max) => min + Math.random() * (max - min);
export const randInt = (min, max) => Math.floor(rand(min, max + 1));
export const pad2 = (n) => String(n).padStart(2, '0');
export const wait = (ms) => new Promise((resolve) => setTimeout(resolve, ms));

/** Nudge a value by a random amount, kept inside [min, max]. */
export function drift(value, amount, min, max) {
  return clamp(value + rand(-amount, amount), min, max);
}

export function escapeHtml(value) {
  return String(value)
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;')
    .replace(/'/g, '&#39;');
}

/** "12d 4h" / "3h 20m" / "14m" — coarse, dashboard-friendly uptime. */
export function formatUptime(sinceMs) {
  const total = Math.max(0, Date.now() - sinceMs);
  const minutes = Math.floor(total / 60000);
  const hours = Math.floor(minutes / 60);
  const days = Math.floor(hours / 24);

  if (days > 0) return `${days}d ${hours % 24}h`;
  if (hours > 0) return `${hours}h ${minutes % 60}m`;
  return `${minutes}m`;
}

/** Media-query backed motion preference that stays current if the user flips it. */
export const motion = (() => {
  const query = window.matchMedia('(prefers-reduced-motion: reduce)');
  let reduced = query.matches;
  const onChange = (event) => { reduced = event.matches; };

  if (typeof query.addEventListener === 'function') {
    query.addEventListener('change', onChange);
  } else if (typeof query.addListener === 'function') {
    query.addListener(onChange);
  }

  return { get reduced() { return reduced; } };
})();
