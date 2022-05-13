###################################################################
#		config-install.sh
#
#
#		
#
###################################################################

## This script installs apps/dependencies for my config and more


## Install the Brew Package Manager

## https://brew.sh
## https://github.com/Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"


## Installs Librewolf 

## https://librewolf.net/ 
## https://gitlab.com/librewolf-community

brew install librewolf


## Installs Kitty

## https://sw.kovidgoyal.net/kitty/
## https://github.com/kovidgoyal/kitty	

brew install kitty 


## Installs Neofetch 

## https://github.com/dylanaraps/neofetch

brew install neofetch



## Installs Ranger 

## https://github.com/ranger/ranger
## https://ranger.github.io/

brew install ranger


## Installs fish 

## https://fishshell.com/
## https://github.com/fish-shell/fish-shell


brew install fish




## Installs Micro Editor 

## https://micro-editor.github.io/
## https://github.com/zyedidia/micro

brew install micro




## Installs neovim

## https://neovim.io/
## https://github.com/neovim

brew install neovim




## Installs vim

## https://www.vim.org/
## https://github.com/vim

brew install vim





## Installs GitHub-CLI

## https://cli.github.com/
## https://github.com/cli/cli


brew install github-cli









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
