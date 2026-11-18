/* The hero clock: the centrepiece of the page.

   Driven off the shared rAF ticker and re-read from Date on every frame, so it
   can never drift the way a naive setInterval counter would. The outer ring
   sweeps with millisecond precision; the text only touches the DOM when the
   value it shows actually changes. */

import { $, pad2 } from './utils.js';
import { onFrame } from './ticker.js';

const STORAGE_KEY = 'boxdeck:hour-format';
const BASE_TITLE = 'Box control dashboard';

const dateFormatter = new Intl.DateTimeFormat(undefined, {
  weekday: 'short',
  day: '2-digit',
  month: 'short',
  year: 'numeric',
});

const zoneFormatter = new Intl.DateTimeFormat(undefined, {
  hour: '2-digit',
  timeZoneName: 'short',
});

/* localStorage throws in some privacy modes; the clock must never die for it. */
function readPreference() {
  try {
    return localStorage.getItem(STORAGE_KEY);
  } catch {
    return null;
  }
}

function zoneLabel(date) {
  const part = zoneFormatter.formatToParts(date).find((p) => p.type === 'timeZoneName');
  if (part) return part.value;

  // Fallback for engines without timeZoneName support.
  const offset = -date.getTimezoneOffset() / 60;
  return `UTC${offset >= 0 ? '+' : '−'}${Math.abs(offset)}`;
}

export function initClock({ onOpenSettings } = {}) {
  const el = {
    hours: $('#clockHours'),
    minutes: $('#clockMinutes'),
    seconds: $('#clockSeconds'),
    meridiem: $('#clockMeridiem'),
    date: $('#clockDate'),
    zone: $('#clockZone'),
    secondsRing: $('#secondsRing'),
    minutesRing: $('#minutesRing'),
    footer: $('#footerClock'),
  };

  if (!el.hours) return;

  let use24 = readPreference() !== '12';

  const secondsCircumference = 2 * Math.PI * Number(el.secondsRing.getAttribute('r'));
  const minutesCircumference = 2 * Math.PI * Number(el.minutesRing.getAttribute('r'));

  for (const [ring, circumference] of [
    [el.secondsRing, secondsCircumference],
    [el.minutesRing, minutesCircumference],
  ]) {
    ring.style.strokeDasharray = String(circumference);
    ring.style.strokeDashoffset = String(circumference);
  }

  let lastSecond = -1;
  let lastMinute = -1;
  let lastDay = -1;

  function paintText(now) {
    const realHours = now.getHours();
    const displayHours = use24 ? realHours : realHours % 12 || 12;

    el.hours.textContent = use24 ? pad2(displayHours) : String(displayHours);
    el.minutes.textContent = pad2(now.getMinutes());
    el.seconds.textContent = pad2(now.getSeconds());

    if (use24) {
      el.meridiem.hidden = true;
      el.meridiem.textContent = '';
    } else {
      el.meridiem.hidden = false;
      el.meridiem.textContent = realHours < 12 ? 'AM' : 'PM';
    }

    const stamp = `${el.hours.textContent}:${el.minutes.textContent}:${el.seconds.textContent}`;
    if (el.footer) el.footer.textContent = stamp;

    // Screen readers get a sentence instead of sixty ticks a minute.
    const clock = el.hours.closest('.clock');
    if (clock) {
      clock.setAttribute('aria-label', `Local time ${stamp}${use24 ? '' : ` ${el.meridiem.textContent}`}`);
    }

    document.title = `${stamp} · ${BASE_TITLE}`;
  }

  function tick() {
    const now = new Date();
    const seconds = now.getSeconds();
    const minutes = now.getMinutes();
    const day = now.getDate();

    // Outer ring sweeps continuously; everything else is change-gated.
    const sweep = (seconds + now.getMilliseconds() / 1000) / 60;
    el.secondsRing.style.strokeDashoffset = String(secondsCircumference * (1 - sweep));

    if (seconds !== lastSecond) {
      lastSecond = seconds;
      paintText(now);

      // Restart the tick animation by forcing a reflow between toggles.
      el.seconds.classList.remove('is-ticking');
      void el.seconds.offsetWidth;
      el.seconds.classList.add('is-ticking');
    }

    if (minutes !== lastMinute) {
      lastMinute = minutes;
      const minuteSweep = (minutes + seconds / 60) / 60;
      el.minutesRing.style.strokeDashoffset = String(minutesCircumference * (1 - minuteSweep));
      el.zone.textContent = zoneLabel(now);
      el.zone.title = Intl.DateTimeFormat().resolvedOptions().timeZone ?? '';
    }

    if (day !== lastDay) {
      lastDay = day;
      el.date.textContent = dateFormatter.format(now);
    }
  }

  tick();
  onFrame(tick);

  const clockRoot = $('#clock');
  const openSettings = () => onOpenSettings?.();

  clockRoot?.addEventListener('click', (event) => {
    event.preventDefault();
    openSettings();
  });
  clockRoot?.addEventListener('keydown', (event) => {
    if (event.key !== 'Enter' && event.key !== ' ') return;
    event.preventDefault();
    openSettings();
  });

  return {
    get use24() { return use24; },
  };
}
