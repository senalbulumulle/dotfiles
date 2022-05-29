###################################################################
#		config-install.sh
#
#
#		
#
###################################################################

## This script installs apps/dependencies for my config and more


## Making sure the pacman repositories/packages are updated
sudo pacman -Su 

## Installs base-devel
sudo pacman -S --noconfirm base-devel 

## Installs yay

## https://cli.github.com/
## https://github.com/cli/cli


## Clone the yay-bin repository
git clone https://aur.archlinux.org/yay-bin.git


## Change directory to yay-bin repository
cd yay-bin



## Install yay
makepkg -si


## Remove the yay-bin folder after installing yay
cd ../
rm -rf yay-bin


## Installs Librewolf 

## https://librewolf.net/ 
## https://gitlab.com/librewolf-community

yay -S --noconfirm librewolf-bin 


## Installs Kitty   

## https://sw.kovidgoyal.net/kitty/
## https://github.com/kovidgoyal/kitty	

yay -S --noconfirm kitty 


## Installs Neofetch 

## https://github.com/dylanaraps/neofetch

yay -S --noconfirm neofetch 



## Installs Ranger 

## https://github.com/ranger/ranger
## https://ranger.github.io/

yay -S --noconfirm ranger 


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


yay -S --noconfirm github-cli 









## Informs the user the system is rebooting. 
## This will ensure that my config files are fully working


echo """

#################################################################
#	Your system will be rebooted in (10)
#
#
#
#################################################################
"""


sleep 1

clear



echo """

#################################################################
#	Your system will be rebooted in (9)
#
#
#
#################################################################
"""


sleep 1

clear



echo """

#################################################################
#	Your system will be rebooted in (8)
#
#
#
#################################################################
"""


sleep 1

clear





echo """

#################################################################
#	Your system will be rebooted in (7)
#
#
#
#################################################################
"""


sleep 1

clear





echo """

#################################################################
#	Your system will be rebooted in (6)
#
#
#
#################################################################
"""


sleep 1

clear






echo """

#################################################################
#	Your system will be rebooted in (5)
#
#
#
#################################################################
"""


sleep 1

clear







echo """

#################################################################
#	Your system will be rebooted in (4)
#
#
#
#################################################################
"""


sleep 1

clear









echo """

#################################################################
#	Your system will be rebooted in (3)
#
#
#
#################################################################
"""


sleep 1

clear






echo """

#################################################################
#	Your system will be rebooted in (2)
#
#
#
#################################################################
"""


sleep 1

clear





echo """

#################################################################
#	Your system will be rebooted in (1)
#
#
#
#################################################################
"""


sleep 1

clear




## Reboots the system

sudo reboot
