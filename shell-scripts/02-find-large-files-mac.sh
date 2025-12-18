#!/usr/bin/env bash
#
# 02-find-large-files-mac.sh
#
# Find the largest directories and files so you can decide what to delete manually.
#
# Usage:
#   ./02-find-large-files-mac.sh            # scan your home folder (default)
#   ./02-find-large-files-mac.sh /path     # scan a specific folder
#
# Notes:
# - This script NEVER deletes anything. It only shows sizes and paths.
# - For a full‑disk scan (e.g. "/"), you may need to run with sudo, but that
#   will include a lot of system files you generally should NOT delete.

set -euo pipefail

TARGET_DIR="${1:-$HOME}"
TOP_N="${TOP_N:-20}"   # You can override: TOP_N=30 ./02-find-large-files-mac.sh
MIN_FILE_SIZE="${MIN_FILE_SIZE:-50M}" # Only show files bigger than this

if [ ! -d "$TARGET_DIR" ]; then
  echo "Error: '$TARGET_DIR' is not a directory."
  exit 1
fi

echo "📂 Scanning directory: $TARGET_DIR"
echo "   Showing top $TOP_N largest entries."
echo

###############################################################################
# Largest directories
###############################################################################

echo "=== Largest directories (by size) ==="
echo "(Sizes are cumulative: directory + everything inside)"
echo

# On macOS, 'du -d' is available and 'sort -h' understands human-readable sizes.
du -hd 4 "$TARGET_DIR" 2>/dev/null | sort -h | tail -n "$TOP_N"

echo

###############################################################################
# Largest files
###############################################################################

echo "=== Largest files (over $MIN_FILE_SIZE) ==="
echo

if command -v gfind >/dev/null 2>&1; then
  # Prefer gfind if available (from GNU findutils via brew) for speed/features
  FIND_BIN="gfind"
else
  FIND_BIN="find"
fi

# Find big files and show their sizes.
# -print0 / xargs -0 handles spaces and weird characters in paths safely.
$FIND_BIN "$TARGET_DIR" -type f -size +"$MIN_FILE_SIZE" -print0 2>/dev/null \
  | xargs -0 du -h 2>/dev/null \
  | sort -h \
  | tail -n "$TOP_N"

echo
echo "Done."
echo "You can now manually delete anything you don't need using 'rm' or the Finder."
echo "Be careful with anything under system folders (e.g. /System, /Library) or app bundles."


