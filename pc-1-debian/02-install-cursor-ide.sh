#!/usr/bin/env bash
## 02-install-cursor-ide.sh

## Installs Cursor IDE on Debian via the official .deb package.

set -e

echo "Fetching latest Cursor download URL"
DEB_URL=$(curl -fsSL "https://www.cursor.com/api/download?platform=linux-x64&releaseTrack=stable" | grep -oP '"debUrl":"\K[^"]+')

TMP_DEB=$(mktemp --suffix=.deb)
echo "Downloading Cursor IDE"
curl -fsSL "$DEB_URL" -o "$TMP_DEB"
chmod 644 "$TMP_DEB"

echo "Installing Cursor IDE"
sudo apt-get install -y "$TMP_DEB"

rm -f "$TMP_DEB"
