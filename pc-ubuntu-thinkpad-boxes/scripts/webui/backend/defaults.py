from __future__ import annotations

METRICS = [
    {"id": "cpu", "name": "Fleet CPU", "unit": "%", "color": "#3584e4", "min": 0, "max": 100, "decimals": 0},
    {"id": "memory", "name": "Memory used", "unit": "%", "color": "#62a0ea", "min": 0, "max": 100, "decimals": 0},
    {"id": "network", "name": "Network", "unit": "Mb/s", "color": "#9141ac", "min": 0, "max": 1000, "decimals": 0},
    {"id": "disk", "name": "Disk I/O", "unit": "MB/s", "color": "#57e389", "min": 0, "max": 600, "decimals": 0},
    {"id": "temp", "name": "Hottest core", "unit": "°C", "color": "#e5a50a", "min": 20, "max": 100, "decimals": 0},
    {"id": "watts", "name": "Power draw", "unit": "W", "color": "#1c71d8", "min": 0, "max": 260, "decimals": 0},
]

POWER = {"idle": 7, "active": 34, "ceiling": 260}

ICONS = {
    "bolt": "M13 3 5 14h6l-1 7 8-11h-6l1-7Z",
    "moon": "M20 14.5A8.5 8.5 0 0 1 9.5 4 8.5 8.5 0 1 0 20 14.5Z",
    "power": "M12 3v9 M6.6 6.6a8 8 0 1 0 10.8 0",
    "refresh": "M20 11A8 8 0 0 0 6.3 6.3L4 8.5 M4 4.5V9h4.5 M4 13a8 8 0 0 0 13.7 4.7L20 15.5 M20 19.5V15h-4.5",
}

SCENES = [
    {
        "id": "all-hands",
        "icon": ICONS["bolt"],
        "name": "All hands",
        "desc": "Wake-on-LAN every enrolled host and wait for probes to report in.",
        "hint": "hold to arm",
    },
    {
        "id": "night-watch",
        "icon": ICONS["moon"],
        "name": "Night watch",
        "desc": "Mark non-essential hosts offline after a suspend signal (SSH required).",
        "hint": "hold to arm",
    },
    {
        "id": "rolling-reboot",
        "icon": ICONS["refresh"],
        "name": "Rolling reboot",
        "desc": "Reboot hosts one at a time when SSH is configured.",
        "hint": "hold to arm",
    },
    {
        "id": "hibernate",
        "icon": ICONS["power"],
        "name": "Hibernate fleet",
        "desc": "Suspend hosts that respond to SSH power commands.",
        "hint": "hold to arm",
    },
]

JOBS = [
    {"when": "on demand", "name": "LAN discovery", "desc": "Scan the configured subnet from Settings", "state": "armed"},
    {"when": "every poll", "name": "Host probe", "desc": "TCP check against the probe port on enrolled boxes", "state": "armed"},
]

DEFAULT_SETTINGS = {
    "subnet": "192.168.1.0/24",
    "probe_port": 22,
    "poll_interval_sec": 5,
    "ssh_user": "",
    "wol_broadcast": "255.255.255.255",
    "agent_port": 8421,
}

HISTORY_LEN = 60