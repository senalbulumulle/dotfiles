/* Hero starfield: three depth bands of drifting stars plus the occasional
   packet streaking across the rack. Canvas, device-pixel-ratio aware. */

import { motion, rand, randInt } from './utils.js';
import { onFrame } from './ticker.js';

const DENSITY = 1 / 9000; // stars per CSS pixel²
const MAX_STARS = 220;
const BANDS = [
  { depth: 0.35, radius: [0.4, 0.9], alpha: [0.18, 0.4], speed: 3 },
  { depth: 0.7, radius: [0.7, 1.4], alpha: [0.3, 0.6], speed: 7 },
  { depth: 1, radius: [1.1, 2.1], alpha: [0.5, 0.95], speed: 13 },
];
const TINTS = ['255, 255, 255', '255, 158, 148', '158, 231, 255', '186, 164, 255'];

export function initStarfield(canvas) {
  if (!canvas) return;

  const ctx = canvas.getContext('2d', { alpha: true });
  if (!ctx) return;

  let width = 0;
  let height = 0;
  let stars = [];
  let packets = [];
  let nextPacket = rand(1200, 4000);

  function makeStar() {
    const band = BANDS[randInt(0, BANDS.length - 1)];
    return {
      x: rand(0, width),
      y: rand(0, height),
      radius: rand(band.radius[0], band.radius[1]),
      alpha: rand(band.alpha[0], band.alpha[1]),
      speed: band.speed,
      tint: TINTS[randInt(0, TINTS.length - 1)],
      phase: rand(0, Math.PI * 2),
      twinkle: rand(0.6, 2.1),
    };
  }

  function resize() {
    const rect = canvas.getBoundingClientRect();
    if (rect.width === 0 || rect.height === 0) return;

    const dpr = Math.min(window.devicePixelRatio || 1, 2);
    width = rect.width;
    height = rect.height;

    canvas.width = Math.round(width * dpr);
    canvas.height = Math.round(height * dpr);
    ctx.setTransform(dpr, 0, 0, dpr, 0, 0);

    const target = Math.min(Math.round(width * height * DENSITY), MAX_STARS);
    stars = Array.from({ length: target }, makeStar);
    packets = [];
  }

  function spawnPacket() {
    const fromLeft = Math.random() < 0.5;
    return {
      x: fromLeft ? -60 : width + 60,
      y: rand(height * 0.08, height * 0.72),
      vx: (fromLeft ? 1 : -1) * rand(0.42, 0.78),
      length: rand(70, 160),
      life: 0,
      maxLife: rand(1400, 2400),
      tint: Math.random() < 0.65 ? '53, 132, 228' : '255, 255, 255',
    };
  }

  function draw(delta) {
    if (width === 0 || height === 0) return;

    ctx.clearRect(0, 0, width, height);

    const seconds = delta / 1000;

    for (const star of stars) {
      star.y -= star.speed * seconds;
      star.phase += star.twinkle * seconds;

      if (star.y < -4) {
        star.y = height + 4;
        star.x = rand(0, width);
      }

      const flicker = 0.72 + 0.28 * Math.sin(star.phase);
      ctx.beginPath();
      ctx.fillStyle = `rgba(${star.tint}, ${(star.alpha * flicker).toFixed(3)})`;
      ctx.arc(star.x, star.y, star.radius, 0, Math.PI * 2);
      ctx.fill();
    }

    nextPacket -= delta;
    if (nextPacket <= 0) {
      packets.push(spawnPacket());
      nextPacket = rand(1800, 5200);
    }

    packets = packets.filter((packet) => {
      packet.life += delta;
      packet.x += packet.vx * delta * 0.18;

      const fade = 1 - packet.life / packet.maxLife;
      if (fade <= 0) return false;

      const tailX = packet.x - Math.sign(packet.vx) * packet.length;
      const gradient = ctx.createLinearGradient(tailX, packet.y, packet.x, packet.y);
      gradient.addColorStop(0, `rgba(${packet.tint}, 0)`);
      gradient.addColorStop(1, `rgba(${packet.tint}, ${(fade * 0.8).toFixed(3)})`);

      ctx.strokeStyle = gradient;
      ctx.lineWidth = 1.4;
      ctx.lineCap = 'round';
      ctx.beginPath();
      ctx.moveTo(tailX, packet.y);
      ctx.lineTo(packet.x, packet.y);
      ctx.stroke();

      return packet.x > -220 && packet.x < width + 220;
    });
  }

  resize();

  if (motion.reduced) {
    // Draw a single static frame and stop there.
    draw(0);
    return;
  }

  if (typeof ResizeObserver === 'function') {
    new ResizeObserver(resize).observe(canvas);
  } else {
    window.addEventListener('resize', resize);
  }

  onFrame(draw);
}
