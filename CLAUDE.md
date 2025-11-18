# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal dotfiles repository containing shell configurations, editor settings, window manager configurations, and utility scripts for macOS and Linux environments.

## Repository Structure

- **fish/** - Fish shell configuration with custom prompt, aliases, and utility scripts
- **i3/** - i3 window manager configuration (Linux)
- **conf/** - Terminal multiplexer configs (.tmux.conf)
- **micro/** - Micro editor settings and keybindings
- **lxde/** - LXDE desktop environment placeholders
- **c/, cpp/, php/, py/** - Programming language workspace directories (currently empty placeholders)
- **shell-scripts/** - General purpose shell scripts
- **png/** - Repository assets and images
- Root level dotfiles: .emacs, .vimrc, .zshrc, .zprofile

## Key Configurations

### Fish Shell (fish/)

The main Fish configuration is in `fish/config.fish` with:
- Cross-platform aliases for macOS and Linux
- Editor shortcuts (microconfig, vimconfig, fishconfig, zshconfig)
- Tool aliases (v for nvim, m for micro, lsl for tree)
- Custom prompt defined in `fish/functions/fish_prompt.fish` with git integration, vi-mode indicators, virtual environment display, and battery status

### i3 Window Manager (i3/)

- Standard i3 config with Mod4 (Super/Windows key) as modifier
- The `i3/index.c` file appears to be a placeholder or build system stub (currently outputs empty string)
- The README mentions using "organization syntaxes from C" but implementation details are minimal

### Zsh (.zshrc)

Minimal Zsh configuration with macOS-specific aliases:
- `mswmo` - Enable macOS single-app mode
- `mswmoo` - Disable macOS single-app mode

### Utility Scripts

- `fish/scripts/01-organize-folders-file-extensions.sh` - File organization script that creates directories by file type (svg, iso, mp3, jpg, dmg, jpeg, zip, pdf) and moves matching files into them

## Platform Support

This repository supports both macOS and Linux (primarily referenced for i3 window manager). The Fish config is designed to work cross-platform with `status is-interactive` checks.

## Notes

- The README mentions Kitty terminal config, but no Kitty configuration files are present in the repository
- Programming language directories (c/, cpp/, php/, py/) are currently empty placeholders with .gitkeep files
- The i3 configuration mentions GCC/G++ as dependencies but the actual C-based organization system is not fully implemented
