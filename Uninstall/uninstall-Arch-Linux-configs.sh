## Making sure the pacman repositories/packages are updated
sudo pacman -Syyu
########################################################################
##	Credits to Chaotic-AUR
##
##	https://aur.chaotic.cx/
##	
########################################################################

sudo pacman-key --recv-key FBA220DFC880C036 --keyserver keyserver.ubuntu.com                                                                                         && \
sudo pacman-key --lsign-key FBA220DFC880C036                                                                                                                         && \        
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
sudo cp pacman.conf /etc/pacman.conf	
sudo pacman -Sy			


## unUnUninstalls pamac-classic

## https://wiki.manjaro.org/index.php/Pamac
## https://gitlab.manjaro.org/applications/pamac

sudo pacman -Rcns --noconfirm pamac-classic


## unUninstalls Librewolf 

## https://librewolf.net/ 
## https://gitlab.com/librewolf-community

sudo pacman -Rcns --noconfirm librewolf


## unUninstalls ungoogled-chromium

##  https://github.com/ungoogled-software/ungoogled-chromium-archlinux
##  https://ungoogled-software.github.io/

sudo pacman -Rcns --noconfirm ungoogled-chromium


## unUninstalls Kitty   

## https://sw.kovidgoyal.net/kitty/
## https://github.com/kovidgoyal/kitty	

sudo pacman -Rcns --noconfirm kitty 


## unUninstalls Neofetch 

## https://github.com/dylanaraps/neofetch

sudo pacman --Rcns --noconfirm neofetch 



## unUninstalls Ranger 

## https://github.com/ranger/ranger
## https://ranger.github.io/

sudo pacman  -Rcns --noconfirm ranger 


## unUninstalls fish 

## https://fishshell.com/
## https://github.com/fish-shell/fish-shell


sudo pacman -Rcns --noconfirm fish 




## unUninstalls Micro Editor 

## https://micro-editor.github.io/
## https://github.com/zyedidia/micro

sudo pacman -Rcns --noconfirm micro 




## unUninstalls neovim

## https://neovim.io/
## https://github.com/neovim

sudo pacman -Rcns --noconfirm neovim 




## unUninstalls vim

## https://www.vim.org/
## https://github.com/vim

sudo pacman -Rcns --noconfirm vim 




## unUninstalls rofi

## https://github.com/davatorium/rofi

sudo pacman -Rcns --noconfirm rofi 



## unUninstalls tint2

## https://gitlab.com/o9000/tint2
## https://github.com/o9000/tint2


sudo pacman -Rcns --noconfirm tint2 





## unUninstalls i3

## https://github.com/i3/i3
## https://github.com/Airblader/i3
## https://i3wm.org/


sudo pacman -Rcns --noconfirm i3 



## unUninstalls OpenBox

## https://github.com/danakj/openbox


sudo pacman -Rcns --noconfirm openbox 




## Uninstalls GitHub-CLI

## https://cli.github.com/
## https://github.com/cli/cli


sudo pacman -Rcns --noconfirm github-cli




## unUninstalls picom

## https://github.com/yshui/picom

sudo pacman -Rcns --noconfirm picom



## unUninstalls Polybar

## https://github.com/polybar/polybar
## https://polybar.github.io/

sudo pacman -Rcns --noconfirm polybar 




## unUninstalls xfce4

## https://xfce.org/

## https://gitlab.xfce.org/explore/groups?sort=name_desc

sudo pacman -Rcns --noconfirm xfce4



## Uninstalls Helix-Editor

## https://helix-editor.com/

## https://github.com/helix-editor/helix

sudo pacman -Rcns --noconfirm helix


## Uninstalls nwg-bar

## https://github.com/nwg-plor/nwg-bar

sudo pacman -Rcns --noconfirm nwg-bar


## Uninstalls Nitrogen

sudo pacman -Rcns --noconfirm nitrogen


## Uninstalls PHP

## https://www.php.net/
## https://github.com/php/

sudo pacman -Rcns --noconfirm php
