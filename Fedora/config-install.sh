###################################################################
#		config-install.sh
#
#
#		
#
###################################################################

## This script installs apps/dependencies for my config and more


## Making sure the DNF repositories/packages are updated
sudo dnf update && sudo dnf upgrade 


## Installs Kitty

## https://sw.kovidgoyal.net/kitty/
## https://github.com/kovidgoyal/kitty	

sudo dnf install kitty


## Installs Neofetch 

## https://github.com/dylanaraps/neofetch

sudo dnf install neofetch


## Removes Firefox 

sudo dnf erase firefox

## Installs Ranger 

## https://github.com/ranger/ranger
## https://ranger.github.io/

sudo dnf install ranger


## Installs fish 

## https://fishshell.com/
## https://github.com/fish-shell/fish-shell


sudo dnf install fish




## Installs Micro Editor 

## https://micro-editor.github.io/
## https://github.com/zyedidia/micro

sudo dnf install micro




## Installs neovim

## https://neovim.io/
## https://github.com/neovim

sudo dnf install neovim




## Installs vim

## https://www.vim.org/
## https://github.com/vim

sudo dnf install vim








## Installs OpenBox

## https://github.com/danakj/openbox


sudo dnf install openbox



## Installs Nitrogen

## https://nitrogenproject.com/

## https://github.com/nitrogen/nitrogen


sudo dnf install nitrogen



## Installs Librewolf

## https://librewolf.net/

## https://gitlab.com/librewolf-community

## https://librewolf.net/installation/fedora/


sudo rpm --import https://keys.openpgp.org/vks/v1/by-fingerprint/034F7776EF5E0C613D2F7934D29FBD5F93C0CFC3

sudo dnf config-manager --add-repo https://rpm.librewolf.net

sudo dnf update

sudo dnf install librewolf




## Installs picom

## https://github.com/yshui/picom

sudo dnf install picom





## 
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
