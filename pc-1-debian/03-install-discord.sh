#!/usr/bin/env bash
## 03-install-discord.sh

## Installs Discord on Debian via the official .deb package.

set -e

TMP_DEB=$(mktemp --suffix=.deb)
echo "Downloading Discord"
curl -fsSL "https://discord.com/api/download?platform=linux&format=deb" -o "$TMP_DEB"
chmod 644 "$TMP_DEB"

echo "Installing Discord"
sudo apt-get install -y "$TMP_DEB"

rm -f "$TMP_DEB"
