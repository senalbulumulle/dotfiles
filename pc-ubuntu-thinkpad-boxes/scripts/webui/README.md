# Box control — OS dashboard

A **scroll-driven** localhost UI for the Ubuntu box fleet — not a marketing
site. One vertical deck: clock at the top, then fleet, power,
services and automation. Navigation is scroll only.

No build step, no dependencies, no outbound network calls.

## Run it

```shell
./serve.sh              # http://localhost:8420
./serve.sh -p 9000      # different port
./serve.sh -b 0.0.0.0   # reachable from the rest of the LAN
./serve.sh --open       # launch the browser too
```

`serve.py` is plain-stdlib Python 3, so `python3 ./serve.py` works just as well.

Opening `index.html` directly from the filesystem will **not** work: ES modules
are blocked on `file://`. The page detects this and says so instead of showing
a blank screen.

## Layout

```
webui/
├── index.html            markup for every section
├── serve.sh / serve.py   localhost static server
└── assets/
    ├── css/styles.css    tokens, layout, components, reduced-motion rules
    └── js/
        ├── app.js        bootstrap and init order
        ├── api.js        HTTP client for /api/v1
        ├── settings.js   clock-opened settings sheet
        ├── store.js      shared state, pub/sub, metric simulation
        ├── actions.js    power actions and service toggles
        ├── clock.js      the hero clock
        ├── parallax.js   scroll + pointer depth
        ├── starfield.js  hero canvas
        ├── ticker.js     the single rAF loop
        ├── fleet.js      box cards
        ├── power.js      scenes and the draw meter
        ├── services.js   unit switches
        ├── automation.js schedule timeline
        ├── chrome.js     status bar depth, spotlight
        ├── reveal.js     scroll reveals and counters
        └── utils.js      shared helpers
```

## Backend (`/api/v1`)

`serve.py` serves both the static UI and a JSON API. Persistent fleet data lives
in `data/fleet.json` (created from `data/fleet.example.json` on first run).

| Method | Path | Purpose |
|--------|------|---------|
| GET | `/api/v1/bootstrap` | Initial load: settings, boxes, scenes, and fleet state |
| GET | `/api/v1/state` | Lightweight poll (every 2s from the UI) |
| PUT | `/api/v1/settings` | Subnet, probe port, SSH user, WOL broadcast |
| POST | `/api/v1/discover` | Scan the LAN for hosts answering on the probe port |
| POST | `/api/v1/boxes` | Enroll a host |
| DELETE | `/api/v1/boxes/:id` | Remove a host |
| POST | `/api/v1/boxes/:id/actions` | `{"action":"wake\|sleep\|reboot\|shutdown"}` |

**Connectivity:** hosts are probed on the configured TCP port (default **22**).
Wake uses the enrolled **MAC** + magic packet. Suspend/reboot/shutdown need
`ssh_user` set and passwordless SSH with sudo on each box.

Optional per-host metrics: run an HTTP agent on `:8421/metrics` returning
`{"cpu":..,"ram":..,"temp":..}` — the poller picks it up automatically.

## Settings UI

Tap the **hero clock** to open the 3D settings sheet: scan the subnet, connect
discovered hosts, or add IP/MAC manually. Demo/simulated fleet data is removed —
the deck starts empty until you enroll hosts.

## Console

Press <kbd>/</kbd> anywhere to jump to the prompt. `help` lists the command set;
<kbd>↑</kbd>/<kbd>↓</kbd> walk the history and <kbd>Tab</kbd> completes a command
name.

```
status           boxes            box <id>
wake <id|all>    sleep <id|all>   reboot <id|all>    shutdown <id>
services         start <unit>     stop <unit>
power            uptime           time               neofetch
```

## Notes

- The clock re-reads `Date` every frame, so it cannot drift. The ring around it
  sweeps with millisecond precision; the toggle switches 24- and 12-hour and
  remembers the choice.
- `prefers-reduced-motion` turns off parallax, the starfield loop, card tilt and
  reveals. The page stays fully usable.
- Everything animated shares one `requestAnimationFrame` loop, which pauses
  while the tab is hidden.