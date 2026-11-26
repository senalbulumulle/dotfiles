#!/usr/bin/env bash
#
# Copies every custom Homebrew formula in this folder into a local tap,
# so they can be installed with: brew install <tap>/<formula>
#
# Usage:
#   ./copy-packages.sh              # uses the tap "$USER/local"
#   ./copy-packages.sh myname/tools # uses a different tap
#
# Every packages/<folder>/*.rb file is copied, except the template folder.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Homebrew stores tap names in lowercase.
TAP="$(printf '%s' "${1:-$USER/local}" | tr '[:upper:]' '[:lower:]')"

# --- checks -----------------------------------------------------------------

if [ "$(uname -s)" != "Darwin" ]; then
  echo "Error: this script is for macOS only." >&2
  exit 1
fi

if ! command -v brew >/dev/null 2>&1; then
  echo "Error: Homebrew is not installed. Get it from https://brew.sh" >&2
  exit 1
fi

case "$TAP" in
  */*) ;;
  *)
    echo "Error: tap name must look like user/repo (got: $TAP)" >&2
    exit 1
    ;;
esac

# --- make sure the tap exists -----------------------------------------------

TAP_DIR="$(brew --repository "$TAP")"

if [ ! -d "$TAP_DIR" ]; then
  echo "Creating local tap $TAP ..."
  brew tap-new --no-git "$TAP"
fi

FORMULA_DIR="$TAP_DIR/Formula"
mkdir -p "$FORMULA_DIR"

# --- copy the formulae ------------------------------------------------------

copied=0

for formula in "$SCRIPT_DIR"/*/*.rb; do
  [ -e "$formula" ] || continue # no matches

  folder="$(basename "$(dirname "$formula")")"
  [ "$folder" = "template" ] && continue

  cp -f "$formula" "$FORMULA_DIR/"
  echo "Copied $folder/$(basename "$formula")"
  copied=$((copied + 1))
done

if [ "$copied" -eq 0 ]; then
  echo "No formulae found to copy."
  exit 0
fi

echo
echo "Copied $copied formula(e) to $FORMULA_DIR"
echo "Install one with: brew install $TAP/<name>"
