#!/usr/bin/env bash
## 07-install-cursor-cli.sh

## Installs the Cursor CLI (cursor-agent) for the current user via the
## official installer script.

set -e

echo "Installing Cursor CLI for user: $(whoami)"
curl https://cursor.com/install -fsS | bash

if [[ -n "${BASH_VERSION:-}" && -f "$HOME/.bashrc" ]] && ! grep -q '.local/bin' "$HOME/.bashrc"; then
    echo "Adding ~/.local/bin to PATH in ~/.bashrc"
    echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$HOME/.bashrc"
fi

echo "Done. Restart your shell (or run: source ~/.bashrc) then run 'cursor-agent' to get started."
