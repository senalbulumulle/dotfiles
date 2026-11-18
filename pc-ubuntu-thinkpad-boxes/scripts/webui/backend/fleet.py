from __future__ import annotations

import copy
import json
import re
import subprocess
import threading
import time
import uuid
from pathlib import Path
from typing import Any

from . import defaults
from .net import discover_subnet, normalize_mac, tcp_reachable, wake_on_lan

_LOCK = threading.RLock()
_DATA_PATH = Path(__file__).resolve().parent.parent / "data" / "fleet.json"
_EXAMPLE_PATH = Path(__file__).resolve().parent.parent / "data" / "fleet.example.json"


def _empty_box_metrics() -> dict[str, float]:
    return {"cpu": 0.0, "ram": 0.0, "temp": 24.0}


def _blank_state() -> dict[str, Any]:
    return {
        "version": 1,
        "settings": copy.deepcopy(defaults.DEFAULT_SETTINGS),
        "boxes": [],
        "services": [],
        "telemetry_history": {mid: [] for mid in (m["id"] for m in defaults.METRICS)},
    }


class FleetStore:
    def __init__(self, data_path: Path | None = None) -> None:
        self.path = data_path or _DATA_PATH
        self._state = _blank_state()
        self._load()

    def _load(self) -> None:
        if self.path.is_file():
            with self.path.open(encoding="utf-8") as handle:
                loaded = json.load(handle)
        elif _EXAMPLE_PATH.is_file():
            with _EXAMPLE_PATH.open(encoding="utf-8") as handle:
                loaded = json.load(handle)
        else:
            loaded = _blank_state()

        with _LOCK:
            self._state = _blank_state()
            self._state["settings"].update(loaded.get("settings") or {})
            self._state["boxes"] = loaded.get("boxes") or []
            self._state["services"] = loaded.get("services") or []
            history = loaded.get("telemetry_history") or {}
            for metric in defaults.METRICS:
                series = history.get(metric["id"], [])
                self._state["telemetry_history"][metric["id"]] = series[-defaults.HISTORY_LEN :]

    def save(self) -> None:
        self.path.parent.mkdir(parents=True, exist_ok=True)
        with _LOCK:
            payload = copy.deepcopy(self._state)
        with self.path.open("w", encoding="utf-8") as handle:
            json.dump(payload, handle, indent=2)
            handle.write("\n")

    def settings(self) -> dict[str, Any]:
        with _LOCK:
            return copy.deepcopy(self._state["settings"])

    def update_settings(self, patch: dict[str, Any]) -> dict[str, Any]:
        allowed = set(defaults.DEFAULT_SETTINGS)
        with _LOCK:
            for key, value in patch.items():
                if key not in allowed:
                    continue
                self._state["settings"][key] = value
            out = copy.deepcopy(self._state["settings"])
        self.save()
        return out

    def boxes(self) -> list[dict]:
        with _LOCK:
            return copy.deepcopy(self._state["boxes"])

    def get_box(self, box_id: str) -> dict | None:
        with _LOCK:
            for box in self._state["boxes"]:
                if box["id"] == box_id:
                    return copy.deepcopy(box)
        return None

    def add_box(self, payload: dict[str, Any]) -> dict:
        ip = (payload.get("ip") or "").strip()
        if not ip:
            raise ValueError("ip is required")

        name = (payload.get("name") or "").strip() or f"box-{ip.replace('.', '-')}"
        box_id = (payload.get("id") or "").strip() or _slug(name)

        with _LOCK:
            if any(b["id"] == box_id for b in self._state["boxes"]):
                box_id = f"{box_id}-{uuid.uuid4().hex[:6]}"
            if any(b.get("ip") == ip for b in self._state["boxes"]):
                raise ValueError("a host with this IP is already enrolled")

            box = {
                "id": box_id,
                "name": name,
                "model": (payload.get("model") or "").strip() or "—",
                "cpu": (payload.get("cpu") or "").strip() or "—",
                "threads": int(payload.get("threads") or 0),
                "ramGb": int(payload.get("ramGb") or 0),
                "storage": (payload.get("storage") or "").strip() or "—",
                "ip": ip,
                "mac": normalize_mac(payload["mac"]) if payload.get("mac") else "",
                "role": (payload.get("role") or "").strip() or "enrolled host",
                "status": "offline",
                "bootedAt": 0,
                "metrics": _empty_box_metrics(),
            }
            self._state["boxes"].append(box)

        self.probe_all()
        self.save()
        return self.get_box(box_id) or box

    def remove_box(self, box_id: str) -> bool:
        with _LOCK:
            before = len(self._state["boxes"])
            self._state["boxes"] = [b for b in self._state["boxes"] if b["id"] != box_id]
            self._state["services"] = [s for s in self._state["services"] if s.get("host") != box_id]
            removed = len(self._state["boxes"]) < before
        if removed:
            self.save()
        return removed

    def probe_all(self) -> None:
        settings = self.settings()
        port = int(settings.get("probe_port") or 22)
        agent_port = int(settings.get("agent_port") or 8421)

        with _LOCK:
            boxes = self._state["boxes"]

        for box in boxes:
            if box.get("status") == "busy":
                continue
            online = tcp_reachable(box["ip"], port)
            with _LOCK:
                target = next((b for b in self._state["boxes"] if b["id"] == box["id"]), None)
                if not target or target.get("status") == "busy":
                    continue
                if online:
                    target["status"] = "online"
                    if not target.get("bootedAt"):
                        target["bootedAt"] = int(time.time() * 1000)
                    self._pull_agent_metrics(target, agent_port)
                else:
                    target["status"] = "offline"
                    target["metrics"] = _empty_box_metrics()
                    target["bootedAt"] = 0

        self._record_telemetry()
        self.save()

    def _pull_agent_metrics(self, box: dict, agent_port: int) -> None:
        """Optional per-host agent on agent_port exposing JSON metrics."""
        try:
            import urllib.request

            url = f"http://{box['ip']}:{agent_port}/metrics"
            with urllib.request.urlopen(url, timeout=0.6) as response:
                data = json.loads(response.read().decode("utf-8"))
            box["metrics"]["cpu"] = float(data.get("cpu", box["metrics"].get("cpu", 0)))
            box["metrics"]["ram"] = float(data.get("ram", box["metrics"].get("ram", 0)))
            box["metrics"]["temp"] = float(data.get("temp", box["metrics"].get("temp", 24)))
        except Exception:
            pass

    def _record_telemetry(self) -> None:
        boxes = self.boxes()
        awake = [b for b in boxes if b.get("status") in ("online", "busy")]
        cpu = _avg(awake, lambda b: b["metrics"].get("cpu", 0))
        memory = _avg(awake, lambda b: b["metrics"].get("ram", 0))
        temp = max((b["metrics"].get("temp", 24) for b in awake), default=24)
        watts = _estimate_watts(len(awake), cpu)

        point = {
            "cpu": round(cpu, 1),
            "memory": round(memory, 1),
            "network": 0.0,
            "disk": 0.0,
            "temp": round(temp, 1),
            "watts": round(watts, 1),
        }

        with _LOCK:
            for metric in defaults.METRICS:
                series = self._state["telemetry_history"].setdefault(metric["id"], [])
                series.append(point[metric["id"]])
                if len(series) > defaults.HISTORY_LEN:
                    del series[: len(series) - defaults.HISTORY_LEN]

    def watts(self) -> float:
        history = self.telemetry_history().get("watts") or []
        return float(history[-1]) if history else 0.0

    def telemetry_history(self) -> dict[str, list[float]]:
        with _LOCK:
            return copy.deepcopy(self._state["telemetry_history"])

    def services(self) -> list[dict]:
        with _LOCK:
            return copy.deepcopy(self._state["services"])

    def set_service_running(self, service_id: str, running: bool) -> dict | None:
        with _LOCK:
            for service in self._state["services"]:
                if service["id"] == service_id:
                    service["running"] = bool(running)
                    service["pending"] = False
                    out = copy.deepcopy(service)
                    break
            else:
                return None
        self.save()
        return out

    def discover(self) -> list[dict]:
        settings = self.settings()
        cidr = settings.get("subnet") or defaults.DEFAULT_SETTINGS["subnet"]
        port = int(settings.get("probe_port") or 22)
        return discover_subnet(cidr, port)

    def run_action(self, box_id: str, action: str) -> dict:
        with _LOCK:
            box = next((b for b in self._state["boxes"] if b["id"] == box_id), None)
        if not box:
            raise ValueError("unknown box")

        settings = self.settings()

        if action == "wake":
            mac = box.get("mac") or ""
            if not mac:
                raise ValueError("MAC address required for wake-on-LAN")
            wake_on_lan(mac, settings.get("wol_broadcast") or "255.255.255.255")
            with _LOCK:
                target = next(b for b in self._state["boxes"] if b["id"] == box_id)
                target["status"] = "busy"
            time.sleep(2.0)
            self.probe_all()
        elif action in {"reboot", "shutdown", "sleep"}:
            self._ssh_power(box, action, settings)
            self.probe_all()
        else:
            raise ValueError(f"unknown action {action}")

        updated = self.get_box(box_id)
        return updated or box

    def _ssh_power(self, box: dict, action: str, settings: dict) -> None:
        user = (settings.get("ssh_user") or "").strip()
        if not user:
            raise ValueError("configure ssh_user in Settings before remote power actions")

        commands = {
            "reboot": "sudo -n systemctl reboot",
            "shutdown": "sudo -n systemctl poweroff",
            "sleep": "sudo -n systemctl suspend",
        }
        cmd = commands[action]
        proc = subprocess.run(
            ["ssh", "-o", "BatchMode=yes", "-o", f"ConnectTimeout=4", f"{user}@{box['ip']}", cmd],
            capture_output=True,
            text=True,
            timeout=12,
            check=False,
        )
        if proc.returncode != 0:
            detail = (proc.stderr or proc.stdout or "ssh failed").strip()
            raise RuntimeError(detail)

    def overview_stats(self) -> dict[str, float]:
        boxes = self.boxes()
        online = sum(1 for b in boxes if b.get("status") == "online")
        threads = sum(int(b.get("threads") or 0) for b in boxes)
        memory = sum(int(b.get("ramGb") or 0) for b in boxes)
        return {
            "boxes": len(boxes),
            "online": online,
            "threads": threads,
            "memoryGb": memory,
            "watts": self.watts(),
        }

    def bootstrap(self) -> dict[str, Any]:
        self.probe_all()
        return {
            "settings": self.settings(),
            "boxes": self.boxes(),
            "services": self.services(),
            "scenes": defaults.SCENES,
            "jobs": defaults.JOBS,
            "metrics": defaults.METRICS,
            "power": defaults.POWER,
            "history": self.telemetry_history(),
            "watts": self.watts(),
            "stats": self.overview_stats(),
        }

    def state_snapshot(self) -> dict[str, Any]:
        return {
            "boxes": self.boxes(),
            "services": self.services(),
            "history": self.telemetry_history(),
            "watts": self.watts(),
            "stats": self.overview_stats(),
        }


def _slug(value: str) -> str:
    slug = re.sub(r"[^a-z0-9]+", "-", value.lower()).strip("-")
    return slug or f"box-{uuid.uuid4().hex[:8]}"


def _avg(boxes: list[dict], pick) -> float:
    if not boxes:
        return 0.0
    return sum(float(pick(b)) for b in boxes) / len(boxes)


def _estimate_watts(awake_count: int, cpu: float) -> float:
    p = defaults.POWER
    if awake_count <= 0:
        return 0.0
    draw = p["idle"] + (p["active"] - p["idle"]) * (cpu / 100.0)
    return min(p["ceiling"], awake_count * draw)


_STORE: FleetStore | None = None


def get_store() -> FleetStore:
    global _STORE
    if _STORE is None:
        _STORE = FleetStore()
    return _STORE


def start_poller() -> None:
    def loop() -> None:
        while True:
            store = get_store()
            interval = max(2, int(store.settings().get("poll_interval_sec") or 5))
            try:
                store.probe_all()
            except Exception:
                pass
            time.sleep(interval)

    thread = threading.Thread(target=loop, name="fleet-poller", daemon=True)
    thread.start()