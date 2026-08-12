<center>
<img src="./branding/senal-dotfiles.png" alt="Senal Dotfiles Logo">
</center>

# Introduction

Welcome to Senal's dotfiles repository, the official repository 
of typical Senal's habitat. Work Smarter Always and Not Harder

# Repository layout

The repo is flat and split by *what a folder is for*:

| Folder | Contains |
| --- | --- |
| `branding/` | Logos and images used by this README. |
| `emacs/`, `kitty/`, `sketchybar/` | Application config files, one folder per app. |
| `scripts/` | Standalone utility scripts you run ad-hoc. See [`scripts/README.md`](./scripts/README.md). |
| *host folders* (see below) | Per-machine setup scripts, run in numeric order. |

## Hosts

One folder per machine, named `<machine>-<os>`. Scripts inside are numbered in
the order they should be run (`01-`, `02-`, …). Empty folders are placeholders
for machines that are not set up yet.

| Host folder | Machine | OS | Status |
| --- | --- | --- | --- |
| `macbook/` | MacBook Pro | macOS | Package install script |
| `pc-1-arch-linux/` | PC 1 | Arch Linux | Empty |
| `pc-1-debian/` | PC 1 | Debian | Claude Code install script |
| `pc-2-arch-linux/` | PC 2 | Arch Linux | Empty |
| `pc-2-debian/` | PC 2 | Debian | Empty |
| `pc-2-windows/` | PC 2 | Windows | Floorp + Cursor install scripts (`.bat`) |
| `thinkpad-t480-alpine-linux/` | ThinkPad T480 | Alpine Linux | Empty |
| `thinkpad-t480-arch-linux/` | ThinkPad T480 | Arch Linux | Empty |

## Conventions

- **Numeric prefixes mean run order.** Host setup scripts use them; the ad-hoc
  utilities in `scripts/` do not, because there is no order to run them in.
- **One folder per app.** Config files sit directly inside, so `kitty/kitty.conf`
  is the file that becomes `~/.config/kitty/kitty.conf`.
- **Scripts are executable and start with a shebang.**

See [ROADMAP.md](./ROADMAP.md) for what is planned next, including the `senal`
command that will handle deploying these files.

# Notices on other branches


The other branches in my dotfiles contain more configuration files 
and some of those configurations are based from the linux distribution's
configuration files, but it is archived for my use-cases, if I need to 
port the files to the main branch. Who knows if the linux distributions
configs that I used will be merged from those branches.
