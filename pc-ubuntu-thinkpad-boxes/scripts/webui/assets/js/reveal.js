/* Scroll reveals and count-up numbers. */

import { $$, clamp, motion } from './utils.js';

const STAGGER = 70;
const MAX_STAGGER = 420;
const COUNT_DURATION = 1500;

/* Growing the root upward means anything the page has already scrolled past
   counts as intersecting. Without it, landing on a deep #anchor would leave
   every section above the target stuck at opacity 0 forever, because jumping
   over an element never changes its intersection ratio. */
const ROOT_MARGIN_TOP = '100000px';

const easeOutExpo = (t) => (t === 1 ? 1 : 1 - 2 ** (-10 * t));

function reveal(element) {
  element.classList.add('is-visible');
}

/** Observe everything marked .reveal / [data-reveal] and stagger siblings. */
export function initReveals() {
  const targets = $$('.reveal, [data-reveal]');
  if (targets.length === 0) return;

  if (motion.reduced || !('IntersectionObserver' in window)) {
    targets.forEach(reveal);
    return;
  }

  // Siblings in the same container cascade instead of popping in together.
  const seen = new Map();
  for (const element of targets) {
    const parent = element.parentElement ?? document.body;
    const index = seen.get(parent) ?? 0;
    seen.set(parent, index + 1);
    element.style.setProperty('--reveal-delay', `${Math.min(index * STAGGER, MAX_STAGGER)}ms`);
  }

  const observer = new IntersectionObserver((entries) => {
    for (const entry of entries) {
      if (!entry.isIntersecting) continue;
      reveal(entry.target);
      observer.unobserve(entry.target);
    }
  }, { threshold: 0.15, rootMargin: `${ROOT_MARGIN_TOP} 0px -6% 0px` });

  targets.forEach((element) => observer.observe(element));
}

function runCount(element) {
  const target = Number(element.dataset.countTo);
  if (!Number.isFinite(target)) return;

  const decimals = Number(element.dataset.countDecimals ?? 0);

  if (motion.reduced) {
    element.textContent = target.toFixed(decimals);
    return;
  }

  const start = performance.now();

  const step = (now) => {
    const progress = clamp((now - start) / COUNT_DURATION, 0, 1);
    element.textContent = (target * easeOutExpo(progress)).toFixed(decimals);
    if (progress < 1) requestAnimationFrame(step);
  };

  requestAnimationFrame(step);
}

/** Numbers animate from zero the first time they scroll into view. */
export function initCounters() {
  const counters = $$('[data-count-to]');
  if (counters.length === 0) return;

  if (!('IntersectionObserver' in window)) {
    counters.forEach(runCount);
    return;
  }

  const observer = new IntersectionObserver((entries) => {
    for (const entry of entries) {
      if (!entry.isIntersecting) continue;
      runCount(entry.target);
      observer.unobserve(entry.target);
    }
  }, { threshold: 0.6, rootMargin: `${ROOT_MARGIN_TOP} 0px 0px 0px` });

  counters.forEach((element) => observer.observe(element));
}
