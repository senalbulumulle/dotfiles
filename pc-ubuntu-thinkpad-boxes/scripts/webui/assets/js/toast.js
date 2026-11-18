/* Corner notifications. */

import { $ } from './utils.js';

const GLYPHS = { ok: '✔', info: '→', warn: '!', err: '✕' };
const MAX_VISIBLE = 4;
const LIFETIME = 4600;

let layer = null;

function dismiss(node) {
  if (!node.isConnected || node.classList.contains('is-leaving')) return;
  node.classList.add('is-leaving');
  node.addEventListener('animationend', () => node.remove(), { once: true });
  // Belt and braces: if the animation never fires, drop the node anyway.
  setTimeout(() => node.remove(), 600);
}

export function toast(title, text = '', type = 'info') {
  layer ??= $('#toasts');
  if (!layer) return;

  const node = document.createElement('div');
  node.className = `toast toast--${type}`;

  const glyph = document.createElement('span');
  glyph.className = 'toast__glyph';
  glyph.textContent = GLYPHS[type] ?? GLYPHS.info;
  glyph.setAttribute('aria-hidden', 'true');

  const body = document.createElement('div');
  body.className = 'toast__body';

  const titleEl = document.createElement('span');
  titleEl.className = 'toast__title';
  titleEl.textContent = title;
  body.append(titleEl);

  if (text) {
    const textEl = document.createElement('span');
    textEl.className = 'toast__text';
    textEl.textContent = text;
    body.append(textEl);
  }

  node.append(glyph, body);
  node.addEventListener('click', () => dismiss(node));
  layer.append(node);

  while (layer.children.length > MAX_VISIBLE) dismiss(layer.firstElementChild);

  setTimeout(() => dismiss(node), LIFETIME);
}
