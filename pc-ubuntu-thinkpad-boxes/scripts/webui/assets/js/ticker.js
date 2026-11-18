/* One requestAnimationFrame loop for the whole page.
   Everything that animates per-frame subscribes here so we never stack loops. */

const tasks = new Set();
let frameId = 0;
let lastTime = 0;

function frame(now) {
  const delta = Math.min(now - lastTime, 100); // clamp after tab-switches
  lastTime = now;

  for (const task of tasks) task(delta, now);

  frameId = requestAnimationFrame(frame);
}

function start() {
  if (frameId) return;
  lastTime = performance.now();
  frameId = requestAnimationFrame(frame);
}

function stop() {
  if (!frameId) return;
  cancelAnimationFrame(frameId);
  frameId = 0;
}

/** Register a per-frame callback. Returns an unsubscribe function. */
export function onFrame(task) {
  tasks.add(task);
  start();
  return () => tasks.delete(task);
}

document.addEventListener('visibilitychange', () => {
  if (document.hidden) stop();
  else start();
});
