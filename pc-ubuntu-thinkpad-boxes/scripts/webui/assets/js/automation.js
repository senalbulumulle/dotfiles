/* The scheduled-job timeline. */

import { state } from './store.js';
import { $, escapeHtml } from './utils.js';

export function initAutomation() {
  const list = $('#automationList');
  if (!list) return;

  const jobs = state.jobs || [];
  list.innerHTML = jobs.map((job) => `
      <li class="job surface reveal">
        <span class="job__when">${escapeHtml(job.when)}</span>
        <span class="job__body">
          <span class="job__name">${escapeHtml(job.name)}</span>
          <span class="job__desc">${escapeHtml(job.desc)}</span>
        </span>
        <span class="tag tag--${escapeHtml(job.state)}">${escapeHtml(job.state)}</span>
      </li>`).join('');
}
