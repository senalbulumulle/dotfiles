#!/usr/bin/env bash
# Removes stow symlinks and restores nothing (files remain in repo).
# Usage: ./unstow.sh [package...]
set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

command -v stow &>/dev/null || { echo "stow not found — install with: sudo pacman -S stow"; exit 1; }

ALL_PACKAGES=(fish nvim zsh hypr waybar alacritty ghostty tmux git rofi btop neofetch)

selected=("${@:-${ALL_PACKAGES[@]}}")

for pkg in "${selected[@]}"; do
  if [[ -d "$DOTFILES/$pkg" ]]; then
    stow --delete --dir="$DOTFILES" --target="$HOME" "$pkg"
    echo "unstowed: $pkg"
  else
    echo "skip:     $pkg (no package dir)"
  fi
done
