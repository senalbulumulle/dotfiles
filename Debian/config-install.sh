###################################################################
#		config-install.sh
#
#
#		
#
###################################################################

## This script installs apps/dependencies for my config and more


## Making sure the APT repositories/packages are updated
sudo apt update && sudo apt upgrade 


## Installs Librewolf 

## https://librewolf.net/
## https://gitlab.com/librewolf-community
## https://librewolf.net/installation/debian/

echo "deb [arch=amd64] http://deb.librewolf.net $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/librewolf.list
sudo wget https://deb.librewolf.net/keyring.gpg -O /etc/apt/trusted.gpg.d/librewolf.gpg
sudo apt install librewolf

## Installs Kitty

## https://sw.kovidgoyal.net/kitty/
## https://github.com/kovidgoyal/kitty	

sudo apt install kitty 


## Installs Neofetch 

## https://github.com/dylanaraps/neofetch

sudo apt install neofetch



## Installs Ranger 

## https://github.com/ranger/ranger
## https://ranger.github.io/

sudo apt install ranger 


## Installs fish 

## https://fishshell.com/
## https://github.com/fish-shell/fish-shell


sudo apt install fish




## Installs Micro Editor 

## https://micro-editor.github.io/
## https://github.com/zyedidia/micro

sudo apt install micro




## Installs neovim

## https://neovim.io/
## https://github.com/neovim

sudo apt install neovim




## Installs vim

## https://www.vim.org/
## https://github.com/vim

sudo apt install vim




## Installs rofi

## https://github.com/davatorium/rofi

sudo apt install rofi



## Installs tint2

## https://gitlab.com/o9000/tint2
## https://github.com/o9000/tint2


sudo apt install tint2





## Installs i3

## https://github.com/i3/i3
## https://github.com/Airblader/i3
## https://i3wm.org/


sudo apt install i3 




## Installs OpenBox

## https://github.com/danakj/openbox


sudo apt install openbox



## Installs Nitrogen

## https://nitrogenproject.com/

## https://github.com/nitrogen/nitrogen


sudo apt install nitrogen


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
