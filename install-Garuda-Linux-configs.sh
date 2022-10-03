## Making sure the pacman repositories/packages are updated
sudo pacman -Syyu
sudo pacman -Sy


## Installs Librewolf

## https://librewolf.net/
## https://gitlab.com/librewolf-community

sudo pacman -S --noconfirm librewolf


## Installs ungoogled-chromium

##  https://github.com/ungoogled-software/ungoogled-chromium-archlinux
##  https://ungoogled-software.github.io/

sudo pacman -S --noconfirm ungoogled-chromium


## Installs Kitty

## https://sw.kovidgoyal.net/kitty/
## https://github.com/kovidgoyal/kitty

sudo pacman -S --noconfirm kitty


## Installs Neofetch

## https://github.com/dylanaraps/neofetch

sudo pacman --S --noconfirm neofetch



## Installs Ranger

## https://github.com/ranger/ranger
## https://ranger.github.io/

sudo pacman  -S --noconfirm ranger


## Installs fish

## https://fishshell.com/
## https://github.com/fish-shell/fish-shell


sudo pacman -S --noconfirm fish




## Installs Micro Editor

## https://micro-editor.github.io/
## https://github.com/zyedidia/micro

sudo pacman -S --noconfirm micro




## Installs neovim

## https://neovim.io/
## https://github.com/neovim

sudo pacman -S --noconfirm neovim




## Installs vim

## https://www.vim.org/
## https://github.com/vim

sudo pacman -S --noconfirm vim




## Installs rofi

## https://github.com/davatorium/rofi

sudo pacman -S --noconfirm rofi



## Installs tint2

## https://gitlab.com/o9000/tint2
## https://github.com/o9000/tint2


sudo pacman -S --noconfirm tint2





## Installs i3

## https://github.com/i3/i3
## https://github.com/Airblader/i3
## https://i3wm.org/


sudo pacman -S --noconfirm i3



## Installs OpenBox

## https://github.com/danakj/openbox


sudo pacman -S --noconfirm openbox




## Installs GitHub-CLI

## https://cli.github.com/
## https://github.com/cli/cli


sudo pacman -S --noconfirm github-cli




## Installs picom

## https://github.com/yshui/picom

sudo pacman -S --noconfirm picom



## Installs Polybar

## https://github.com/polybar/polybar
## https://polybar.github.io/

sudo pacman -S --noconfirm polybar




## Installs xfce4

## https://xfce.org/

## https://gitlab.xfce.org/explore/groups?sort=name_desc

sudo pacman -S --noconfirm xfce4



## Installs Helix-Editor

## https://helix-editor.com/

## https://github.com/helix-editor/helix

sudo pacman -S --noconfirm helix


## Installs nwg-bar

## https://github.com/nwg-plor/nwg-bar

sudo pacman -S --noconfirm nwg-bar


## Installs Nitrogen

sudo pacman -S --noconfirm nitrogen


## Installs PHP

## https://www.php.net/
## https://github.com/php/

sudo pacman -S --noconfirm php


## Installs notes

## https://github.com/pimterry/notes

curl -Ls https://raw.githubusercontent.com/pimterry/notes/latest-release/install.sh | sudo bash


## Installs Oh My Fish

## https://github.com/oh-my-fish/oh-my-fish

curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish



## Installs Doom Vim
## https://github.com/NTBBloodbath/doom-nvim
bash <(curl -s https://raw.githubusercontent.com/NTBBloodbath/doom-nvim/main/tools/install.sh)



## Installs Configuration Files
cd Garuda-Linux
sh configure.sh
