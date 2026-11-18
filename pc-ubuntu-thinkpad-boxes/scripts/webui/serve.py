#!/usr/bin/env python3
"""Serve the box control dashboard and the /api/v1 backend on one port."""

from __future__ import annotations

import argparse
import contextlib
import socket
import socketserver
import sys
import webbrowser
from pathlib import Path

from backend.fleet import get_store, start_poller
from backend.handler import AppHandler

ROOT = Path(__file__).resolve().parent
DEFAULT_PORT = 8420


class Server(socketserver.ThreadingTCPServer):
    allow_reuse_address = True
    daemon_threads = True


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Run the box control dashboard and API.")
    parser.add_argument("-p", "--port", type=int, default=DEFAULT_PORT)
    parser.add_argument("-b", "--bind", default="127.0.0.1")
    parser.add_argument("--open", action="store_true", help="open the page in the default browser")
    return parser.parse_args()


def main() -> int:
    args = parse_args()

    index = ROOT / "index.html"
    if not index.is_file():
        print(f"error: {index} is missing", file=sys.stderr)
        return 1

    get_store()
    start_poller()

    url = f"http://{'localhost' if args.bind in ('127.0.0.1', '0.0.0.0') else args.bind}:{args.port}/"

    try:
        server = Server((args.bind, args.port), AppHandler)
    except OSError as error:
        print(f"error: cannot bind {args.bind}:{args.port} — {error}", file=sys.stderr)
        return 1

    data_file = ROOT / "data" / "fleet.json"
    print("  box control dashboard + API")
    print(f"  static  {ROOT}")
    print(f"  data    {data_file}")
    print(f"  → {url}")
    if args.bind == "0.0.0.0":
        with contextlib.suppress(OSError):
            print(f"  → http://{socket.gethostbyname(socket.gethostname())}:{args.port}/")
    print("  ctrl-c to stop\n")

    if args.open:
        with contextlib.suppress(Exception):
            webbrowser.open(url)

    with server:
        try:
            server.serve_forever()
        except KeyboardInterrupt:
            print("\n  stopped")

    return 0


if __name__ == "__main__":
    sys.exit(main())