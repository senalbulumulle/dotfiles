const BASE = '/api/v1';

async function request(path, options = {}) {
  const response = await fetch(`${BASE}${path}`, {
    headers: { 'Content-Type': 'application/json', ...(options.headers || {}) },
    ...options,
  });

  const text = await response.text();
  let body = {};
  if (text) {
    try {
      body = JSON.parse(text);
    } catch {
      body = { error: text };
    }
  }

  if (!response.ok) {
    throw new Error(body.error || `request failed (${response.status})`);
  }

  return body;
}

export const fetchBootstrap = () => request('/bootstrap');
export const fetchState = () => request('/state');
export const fetchSettings = () => request('/settings');
export const saveSettings = (settings) => request('/settings', { method: 'PUT', body: JSON.stringify(settings) });
export const discoverHosts = (subnet) => request('/discover', { method: 'POST', body: JSON.stringify({ subnet }) });
export const enrollHost = (payload) => request('/boxes', { method: 'POST', body: JSON.stringify(payload) });
export const removeHost = (id) => request(`/boxes/${encodeURIComponent(id)}`, { method: 'DELETE' });
export const runBoxAction = (id, action) =>
  request(`/boxes/${encodeURIComponent(id)}/actions`, {
    method: 'POST',
    body: JSON.stringify({ action }),
  });
export const toggleService = (id, running) =>
  request(`/services/${encodeURIComponent(id)}`, {
    method: 'POST',
    body: JSON.stringify({ running }),
  });