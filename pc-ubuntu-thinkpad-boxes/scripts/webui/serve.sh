#!/usr/bin/env bash
# Start the box control dashboard. Any arguments are passed through to serve.py.
set -euo pipefail

cd "$(dirname "$0")"

if ! command -v python3 >/dev/null 2>&1; then
  echo "python3 is required (sudo apt install python3 -y)" >&2
  exit 1
fi

exec python3 ./serve.py "$@"
