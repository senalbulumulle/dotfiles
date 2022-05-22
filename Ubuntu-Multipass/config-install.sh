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




## Installs build-essential
sudo apt install build-essential



## Installs openjdk

## https://openjdk.java.net/
## https://github.com/openjdk
sudo apt install openjdk


## Installs php 

## https://www.php.net/
## https://github.com/php


sudo apt install php 



## Installs nodejs

## https://nodejs.org/en/
## https://github.com/nodejs 


sudo apt install nodejs



## Installs npm 

## https://www.npmjs.com/
## https://github.com/npm


sudo apt install npm
 











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
