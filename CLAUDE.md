# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal dotfiles repository containing shell configurations, window manager setups, editor settings, and utility scripts for macOS and Linux environments.

## Repository Structure

- **fish/** - Fish shell configuration with custom prompt and utility scripts
  - `config.fish` - Main configuration with aliases for editor configs and tools
  - `functions/fish_prompt.fish` - Custom prompt with git integration, vi-mode indicators, virtual environment display, and battery status
  - `scripts/01-organize-folders-file-extensions.sh` - File organization utility
- **i3/** - i3 window manager setup with C-based configuration system
  - `configuration.c` - C source for generating i3 config
  - `Makefile` - Build commands: `make compile`, `make sendit`, `make clean`
  - `install.sh` - Arch Linux dependency installer for i3
- **hypr/** - Hyprland Wayland compositor setup
  - `configuration.c` - C source for generating Hyprland config
  - `Makefile` - Build commands (same structure as i3)
  - `install.sh` - Arch Linux dependency installer for Hyprland
  - `toggle-monitors.sh` - Monitor configuration utility
- **conf/** - Terminal multiplexer configuration (.tmux.conf)
- **micro/** - Micro editor settings.json and bindings.json
- Root level dotfiles: .emacs, .vimrc, .zshrc, .zprofile

## Key Configurations

### Fish Shell

Main config at `fish/config.fish` with interactive mode aliases:
- Editor config shortcuts: `microconfig`, `vimconfig`, `bashconfig`, `fishconfig`, `zshconfig`
- Editor shortcuts: `v` (nvim), `m` (micro), `lvim` (LunarVim at ~/.local/bin/lvim)
- Utilities: `lsl` (tree), `markdown` (MarkText.app), `organizefbext` (file organizer script)

Custom prompt in `fish/functions/fish_prompt.fish` displays:
- User@hostname with color coding (red for root, yellow for user; cyan for SSH, blue for local)
- Current path, time, vi-mode indicator, virtual environment, git status, battery level
- Background jobs list
- Two-line format with Unicode box drawing characters

### Zsh

Minimal configuration in `.zshrc` with macOS-specific aliases:
- `mswmo` - Enable single-app mode (hide other apps)
- `mswmoo` - Disable single-app mode

### i3/Hyprland Window Managers

Both use a C-based configuration approach:
1. Edit `configuration.c` to define settings
2. Run `make compile` to build (generates `a.out`)
3. Run `make sendit` to execute and generate config
4. Run `make clean` to remove compiled binary

Install scripts (`install.sh`) use `pacman --noconfirm` for Arch Linux dependency installation. The hyprland install script will automatically reboot after 5 seconds.

### Utility Scripts

`fish/scripts/01-organize-folders-file-extensions.sh` - Creates directories for common file types (svg, iso, mp3, jpg, dmg, jpeg, zip, pdf) and moves matching files into them. Run from the directory containing files to organize.

## Platform Support

- **macOS**: Primary platform for Fish and Zsh configs
- **Linux (Arch)**: i3 and Hyprland configurations with pacman-based installers
