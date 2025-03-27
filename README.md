# Senal's Configuration Files


Senal's own dotfiles manager

## Introduction
Senal's wonderful dotfiles manager allows the ability to get inspired and 
get creative and be innovative with talent. 

With Senal's dotfiles manager, you realize the organization of setups that
Senal has will definitely makes you want to do something.



# List of Files


```shell

total 128
-rw-r--r--   1 senal  staff   2.4K Mar 19 12:00 .emacs
drwxr-xr-x  14 senal  staff   448B Mar 27 10:31 .git/
-rw-r--r--   1 senal  staff    74B Mar 22 00:18 .gitignore
-rw-r--r--   1 senal  staff     1B Mar 12 13:54 .vimrc
-rw-r--r--   1 senal  staff    42B Mar 12 13:54 .zprofile
-rw-r--r--   1 senal  staff   330B Mar 12 13:54 .zshrc
-rw-r--r--   1 senal  staff   5.1K Mar 17 14:54 Cargo.lock
-rw-r--r--   1 senal  staff   130B Mar 12 13:54 Cargo.toml
-rw-r--r--   1 senal  staff   3.3K Mar 27 10:34 README.md
drwxr-xr-x   3 senal  staff    96B Mar 21 15:48 Ubuntu-Linux/
drwxr-xr-x   3 senal  staff    96B Mar 12 13:54 _Wallpapers/
-rw-r--r--   1 senal  staff    16K Mar 12 13:54 dotfiles-logo.png
drwxr-xr-x   6 senal  staff   192B Mar 13 11:27 fish/
drwxr-xr-x   3 senal  staff    96B Mar 19 11:59 i3/
-rw-r--r--   1 senal  staff   597B Mar 12 13:54 install.sh
drwxr-xr-x   4 senal  staff   128B Mar 12 13:54 kitty/
drwxr-xr-x   8 senal  staff   256B Mar 21 18:31 macOS/
drwxr-xr-x   5 senal  staff   160B Mar 26 12:30 micro/
drwxr-xr-x   6 senal  staff   192B Mar 26 12:46 nvim/
-rw-r--r--   1 senal  staff   176B Mar 12 13:54 push.ps1
-rw-r--r--   1 senal  staff   175B Mar 12 13:54 push.sh
drwxr-xr-x  11 senal  staff   352B Mar 17 13:39 scripts/
drwxr-xr-x   7 senal  staff   224B Mar 23 18:04 src/

```



# Fish Config

```
total 16
drwxr-xr-x  2 senal  staff    64B Feb 22 14:15 completions/
drwxr-xr-x  2 senal  staff    64B Feb 22 14:15 conf.d/
-rw-r--r--  1 senal  staff   486B Feb 22 14:16 config.fish
-rw-r--r--  1 senal  staff   1.3K Feb 22 14:15 fish_variables
drwxr-xr-x  4 senal  staff   128B Feb 22 14:15 functions/
drwxr-xr-x  2 senal  staff    64B Feb 22 14:16 scripts/
```



# Kitty Config

```
total 104
-rw-r--r--  1 senal  staff    48K Feb 13 19:09 kitty.conf
-rw-r--r--  1 senal  staff   334B Feb 13 19:09 senal.conf
```



# Neovim Config

```
total 16
-rw-r--r--  1 senal  staff    76B Feb 22 13:23 init.lua
drwxr-xr-x  3 senal  staff    96B Feb 10 13:03 lua/
-rw-r--r--  1 senal  staff   210B Feb 10 13:03 readme
```



# Scripts files

```
total 48
drwxr-xr-x  3 senal  staff    96B Feb 10 18:49 ThinkPad-T480/
drwxr-xr-x  3 senal  staff    96B Feb 12 17:23 ThinkPad-X41/
-rw-r--r--  1 senal  staff   2.0K Feb 20 22:02 configure-yabai.sh
-rw-r--r--  1 senal  staff   373B Feb 10 13:03 setup-arch-laptop.sh
-rw-r--r--  1 senal  staff   412B Feb 10 13:03 setup-arch-server.sh
-rw-r--r--  1 senal  staff   441B Feb 10 13:03 setup-arch-vm-pc-setup.sh
-rw-r--r--  1 senal  staff   1.2K Feb 24 11:56 setup-mac-laptop-dad.sh
-rw-r--r--  1 senal  staff   1.1K Mar  4 07:46 setup-mac-laptop.sh

```

# SymLinking .vimrc Config on macOS 🔗

```
ln -s /Users/$USER/dotfiles/.vimrc /Users/$USER/.vimrc
```


# SymLinking .zshrc Config on macOS 🔗
```
ln -s /Users/$USER/dotfiles/.zshrc /Users/$USER/.zshrc
```


# SymLinking emacs Config on macOS 🔗
```
ln -f /Users/$USER/dotfiles/.emacs /Users/$USER/.emacs
```

# SymLinking Fish Config on macOS 🔗
```
ln -s /Users/$USER/dotfiles/fish /Users/$USER/.config/fish
```


# SymLinking Micro Config on macOS 🔗
```
ln -s /Users/$USER/dotfiles/micro /Users/$USER/.config/micro
```



# SymLinking Neovim Config on macOS 🔗

## Symlinking (macOS) Senal's Neovim Official Config
```
rm -rf /Users/$USER/.local/nvim
ln -s /Users/$USER/dotfiles/nvim /Users/$USER/.config/nvim
```




## Symlinking (macOS) AstroNvim Config
```
rm -rf /Users/$USER/.local/nvim
ln -s /Users/$USER/dotfiles/AstroNvim /Users/$USER/.config/nvim
```



## Symlinking (macOS) NvChad Config
```
rm -rf /Users/$USER/.local/nvim
ln -s /Users/$USER/dotfiles/AstroNvim /Users/$USER/.config/nvim
```