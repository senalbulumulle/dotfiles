from __future__ import annotations

import json
import mimetypes
import re
import sys
from http import HTTPStatus
from http.server import BaseHTTPRequestHandler
from pathlib import Path
from urllib.parse import parse_qs, urlparse

from .fleet import get_store

WEB_ROOT = Path(__file__).resolve().parent.parent
API_PREFIX = "/api/v1"


class AppHandler(BaseHTTPRequestHandler):
    server_version = "BoxControl/1.0"

    def log_message(self, fmt: str, *args) -> None:
        sys.stderr.write(f"  {self.address_string()}  {fmt % args}\n")

    def end_headers(self) -> None:
        self.send_header("Cache-Control", "no-store, max-age=0")
        self.send_header("X-Content-Type-Options", "nosniff")
        super().end_headers()

    def do_OPTIONS(self) -> None:
        self.send_response(HTTPStatus.NO_CONTENT)
        self._cors()
        self.end_headers()

    def do_GET(self) -> None:
        path = urlparse(self.path).path
        if path.startswith(API_PREFIX):
            return self._route_api("GET", path)
        return self._serve_static(path)

    def do_PUT(self) -> None:
        path = urlparse(self.path).path
        if path.startswith(API_PREFIX):
            return self._route_api("PUT", path)

    def do_POST(self) -> None:
        path = urlparse(self.path).path
        if path.startswith(API_PREFIX):
            return self._route_api("POST", path)

    def do_DELETE(self) -> None:
        path = urlparse(self.path).path
        if path.startswith(API_PREFIX):
            return self._route_api("DELETE", path)

    def _route_api(self, method: str, path: str) -> None:
        store = get_store()

        try:
            if method == "GET" and path == f"{API_PREFIX}/bootstrap":
                return self._json(HTTPStatus.OK, store.bootstrap())
            if method == "GET" and path == f"{API_PREFIX}/state":
                return self._json(HTTPStatus.OK, store.state_snapshot())
            if method == "GET" and path == f"{API_PREFIX}/settings":
                return self._json(HTTPStatus.OK, store.settings())
            if method == "GET" and path == f"{API_PREFIX}/discover":
                return self._json(HTTPStatus.OK, {"hosts": store.discover()})

            if method == "PUT" and path == f"{API_PREFIX}/settings":
                body = self._read_json()
                return self._json(HTTPStatus.OK, store.update_settings(body))

            if method == "POST" and path == f"{API_PREFIX}/discover":
                body = self._read_json()
                subnet = body.get("subnet")
                if subnet:
                    store.update_settings({"subnet": subnet})
                return self._json(HTTPStatus.OK, {"hosts": store.discover()})

            if method == "POST" and path == f"{API_PREFIX}/boxes":
                body = self._read_json()
                box = store.add_box(body)
                return self._json(HTTPStatus.CREATED, box)

            match = re.fullmatch(rf"{re.escape(API_PREFIX)}/boxes/([^/]+)/actions", path)
            if method == "POST" and match:
                box_id = match.group(1)
                body = self._read_json()
                action = body.get("action")
                if not action:
                    raise ValueError("action is required")
                box = store.run_action(box_id, action)
                return self._json(HTTPStatus.OK, box)

            match = re.fullmatch(rf"{re.escape(API_PREFIX)}/boxes/([^/]+)", path)
            if method == "DELETE" and match:
                removed = store.remove_box(match.group(1))
                if not removed:
                    return self._json(HTTPStatus.NOT_FOUND, {"error": "not found"})
                return self._json(HTTPStatus.OK, {"ok": True})

            match = re.fullmatch(rf"{re.escape(API_PREFIX)}/services/([^/]+)", path)
            if method == "POST" and match:
                body = self._read_json()
                service = store.set_service_running(match.group(1), bool(body.get("running")))
                if not service:
                    return self._json(HTTPStatus.NOT_FOUND, {"error": "not found"})
                return self._json(HTTPStatus.OK, service)

            return self._json(HTTPStatus.NOT_FOUND, {"error": "not found"})
        except ValueError as error:
            return self._json(HTTPStatus.BAD_REQUEST, {"error": str(error)})
        except RuntimeError as error:
            return self._json(HTTPStatus.BAD_GATEWAY, {"error": str(error)})
        except json.JSONDecodeError:
            return self._json(HTTPStatus.BAD_REQUEST, {"error": "invalid JSON"})
        except Exception as error:
            return self._json(HTTPStatus.INTERNAL_SERVER_ERROR, {"error": str(error)})

    def _serve_static(self, path: str) -> None:
        if path in {"", "/"}:
            path = "/index.html"

        target = (WEB_ROOT / path.lstrip("/")).resolve()
        if not str(target).startswith(str(WEB_ROOT.resolve())):
            return self._json(HTTPStatus.FORBIDDEN, {"error": "forbidden"})

        if not target.is_file():
            return self._json(HTTPStatus.NOT_FOUND, {"error": "not found"})

        mime, _ = mimetypes.guess_type(target.as_posix())
        if target.suffix == ".js":
            mime = "text/javascript"
        elif target.suffix == ".mjs":
            mime = "text/javascript"
        elif target.suffix == ".css":
            mime = "text/css"
        elif target.suffix == ".svg":
            mime = "image/svg+xml"

        data = target.read_bytes()
        self.send_response(HTTPStatus.OK)
        if mime:
            self.send_header("Content-Type", mime)
        self.send_header("Content-Length", str(len(data)))
        self.end_headers()
        self.wfile.write(data)

    def _read_json(self) -> dict:
        length = int(self.headers.get("Content-Length") or 0)
        raw = self.rfile.read(length) if length else b"{}"
        parsed = json.loads(raw.decode("utf-8") or "{}")
        if not isinstance(parsed, dict):
            raise ValueError("JSON body must be an object")
        return parsed

    def _json(self, status: HTTPStatus, payload: dict | list) -> None:
        data = json.dumps(payload).encode("utf-8")
        self.send_response(status)
        self.send_header("Content-Type", "application/json; charset=utf-8")
        self.send_header("Content-Length", str(len(data)))
        self._cors()
        self.end_headers()
        self.wfile.write(data)

    def _cors(self) -> None:
        origin = self.headers.get("Origin")
        if origin:
            self.send_header("Access-Control-Allow-Origin", origin)
            self.send_header("Vary", "Origin")
            self.send_header("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE, OPTIONS")
            self.send_header("Access-Control-Allow-Headers", "Content-Type")