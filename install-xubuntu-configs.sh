## This script installs apps/dependencies for my config and more

## Enable Flathub
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

## Installs Flatpak 
sudo apt install flatpak -y

## Installs Librewolf via Flatpak
flatpak install flathub io.gitlab.librewolf-community

## Installs Discord via Flatpak
flatpak install flathub com.discordapp.Discord

## Installs Zoom via Flatpak
flatpak install flathub us.zoom.Zoom



## Installs Kitty

## https://sw.kovidgoyal.net/kitty/
## https://github.com/kovidgoyal/kitty

sudo apt install kitty -y


## Installs Neofetch

## https://github.com/dylanaraps/neofetch

sudo apt install neofetch -y



## Installs Ranger

## https://github.com/ranger/ranger
## https://ranger.github.io/

sudo apt install ranger -y


## Installs fish

## https://fishshell.com/
## https://github.com/fish-shell/fish-shell


sudo apt install fish -y




## Installs Micro Editor

## https://micro-editor.github.io/
## https://github.com/zyedidia/micro

sudo apt install micro -y




## Installs neovim

## https://neovim.io/
## https://github.com/neovim

sudo apt install neovim -y




## Installs vim

## https://www.vim.org/
## https://github.com/vim

sudo apt install vim -y




## Installs rofi

## https://github.com/davatorium/rofi

sudo apt install rofi -y



## Installs tint2

## https://gitlab.com/o9000/tint2
## https://github.com/o9000/tint2


sudo apt install tint2 -y





## Installs i3

## https://github.com/i3/i3
## https://github.com/Airblader/i3
## https://i3wm.org/


sudo apt install i3 -y




## Installs OpenBox

## https://github.com/danakj/openbox


sudo apt install openbox -y



## Installs Nitrogen

## https://nitrogenproject.com/

## https://github.com/nitrogen/nitrogen


sudo apt install nitrogen -y



## Installs picom

## https://github.com/yshui/picom

sudo apt install picom -y




## Installs Polybar

## https://github.com/polybar/polybar
## https://polybar.github.io/

sudo apt install polybar -y


## Installs xfce4

## https://xfce.org/

## https://gitlab.xfce.org/explore/groups?sort=name_desc

sudo apt install xfce4 -y


## Installs xfce4-terminal

sudo apt install xfce4-terminal -y


## Installs Curl

## https://curl.se/

## https://github.com/curl/curl

sudo apt install curl -y


## Installs notes

## https://github.com/pimterry/notes

curl -Ls https://raw.githubusercontent.com/pimterry/notes/latest-release/install.sh | sudo bash


## Installs Make

## https://www.gnu.org/software/make/

## https://github.com/mirror/make

sudo apt install make -y


## Installs Oh My Fish

## https://github.com/oh-my-fish/oh-my-fish

curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish



## Installs Configuration Files
cd Ubuntu-Linux && sh configure.sh
