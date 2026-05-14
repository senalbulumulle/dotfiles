#!/usr/bin/env bash
# Copies dotfiles from $HOME into stow package directories, then creates symlinks.
# Usage: ./sync.sh [package...]   (no args = all packages)
set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

command -v stow &>/dev/null || { echo "stow not found — install with: sudo pacman -S stow"; exit 1; }

declare -A PKG_SOURCES=(
  [fish]=".config/fish"
  [nvim]=".config/nvim"
  [zsh]=".zshrc .p10k.zsh"
  [hypr]=".config/hypr"
  [waybar]=".config/waybar"
  [alacritty]=".config/alacritty"
  [ghostty]=".config/ghostty"
  [tmux]=".tmux.conf"
  [git]=".gitconfig"
  [rofi]=".config/rofi"
  [btop]=".config/btop"
  [neofetch]=".config/neofetch"
)

usage() {
  echo "Usage: $0 [package...]"
  printf "Packages: %s\n" "${!PKG_SOURCES[*]}"
  exit 1
}

is_our_symlink() {
  [[ -L "$1" ]] && [[ "$(readlink -f "$1" 2>/dev/null)" == "$DOTFILES"* ]]
}

sync_pkg() {
  local pkg="$1"
  read -ra sources <<< "${PKG_SOURCES[$pkg]}"

  echo "==> $pkg"

  for src in "${sources[@]}"; do
    local home_path="$HOME/$src"
    local repo_path="$DOTFILES/$pkg/$src"

    if [[ ! -e "$home_path" ]] && [[ ! -L "$home_path" ]]; then
      echo "    skip  ~/$src (not found)"
      continue
    fi

    if is_our_symlink "$home_path"; then
      echo "    ok    ~/$src (already stowed)"
      continue
    fi

    mkdir -p "$(dirname "$repo_path")"

    if [[ -d "$home_path" ]]; then
      rsync -a --delete "$home_path/" "$repo_path/"
      rm -rf "$home_path"
      echo "    moved ~/$src/"
    else
      cp -f "$home_path" "$repo_path"
      rm -f "$home_path"
      echo "    moved ~/$src"
    fi
  done

  stow --restow --dir="$DOTFILES" --target="$HOME" "$pkg"
  echo "    stowed"
}

if [[ $# -gt 0 ]]; then
  for pkg in "$@"; do
    [[ -z "${PKG_SOURCES[$pkg]+_}" ]] && { echo "Unknown package: $pkg"; usage; }
    sync_pkg "$pkg"
  done
else
  for pkg in "${!PKG_SOURCES[@]}"; do
    sync_pkg "$pkg"
  done
fi

echo ""
echo "Done. Commit with: git add -A && git commit"
