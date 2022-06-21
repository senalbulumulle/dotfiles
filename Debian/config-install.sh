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
## 

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



## Installs i3 (installs i3-gaps manually)

## https://github.com/i3/i3
## https://github.com/Airblader/i3
## https://i3wm.org/




## Installs autoconf 
sudo apt install autoconf 

## Installs build-essential
sudo apt install build-essential

## Installs git 
sudo apt install stow 

## Installs stow
sudo apt install stow

## Installs tmux 
sudo apt install tmux

## Installs tree
sudo apt install tree

## Adds the Debian backports 
echo "deb http://ftp.debian.org/debian stretch-backports main" > /etc/apt/sources.list.d/backports.list
apt update


## Installs libev-dev
sudo apt install libev-dev

## Installs libpango1.0-dev
sudo apt install libpango1.0-dev

## Installs libstartup-notification0-dev
sudo apt install libstartup-notification0-dev

## Installs libxcb-cursor-dev
sudo apt install libxcb-cursor-dev

## Installs libxcb-icccm4-dev
sudo apt install libxcb-icccm4-dev

## Installs libxcb-keysyms1-dev
sudo apt install libxcb-keysyms1-dev

## Installs libxcb-randr0-dev
sudo apt install libxcb-randr0-dev

## Installs libxcb-util0-dev
sudo apt install libxcb-util0-dev

## Installs libxcb-xinerama0-dev
sudo apt install libxcb-xinerama0-dev

## Installs libxcb-xkb-dev
sudo apt install libxcb-xkb-dev

## Installs libxcb-xrm-dev
sudo apt install libxcb-xrm-dev

## Installs libxcb-xrm0
sudo apt install libxcb-xrm0

## Installs libxcb1-dev
sudo apt install libxcb1-dev

## Installs libxkbcommon-dev
sudo apt install libxkbcommon-dev

## Installs libxkbcommon-x11-dev
sudo apt install libxkbcommon-x11-dev

## Installs libyajl-dev
sudo apt install libyajl-dev

## Installs xcb
sudo apt install xcb


## Change the directory to /usr/local/src/
cd /usr/local/src

## Clone the i3-gaps repository
git clone https://github.com/Airblader/i3 i3-gaps
cd i3-gaps


## Build the source 
hash=$(git rev-parse --short HEAD)
autoreconf --force --install
mkdir build && cd "$_"
../configure --prefix=/usr/local --sysconfdir=/etc --disable-sanitizers
make PREFIX=/usr/local
make install prefix=/usr/local/stow/i3-gaps-$(hash)


## Set some permissions in order to work 
find /usr/local/stow/i3-gaps-$(hash) -type d -exec chmod 755 {} \;
find /usr/local/stow/i3-gaps-$(hash) -type f -exec chmod 644 {} \;
chmod -R 755 /usr/local/stow/i3-gaps-$(hash)/bin


## Install sym links 
cd /usr/local/stow
stow i3-gaps-$(hash)


## Installs feh
sudo apt install feh

## Installs i3blocks
sudo apt install i3blocks

## Installs i3lock
sudo apt install i3lock

## Installs suckless-tools
sudo apt install suckless-tools

## Installs xorg 
sudo apt install xorg 






## Installs OpenBox

## https://github.com/danakj/openbox


sudo apt install openbox



## Installs Nitrogen

## https://nitrogenproject.com/

## https://github.com/nitrogen/nitrogen


sudo apt install nitrogen



## Installs picom 

## https://github.com/yshui/picom

sudo apt install picom



## Installs Polybar

## https://github.com/polybar/polybar
## https://polybar.github.io/

sudo apt install polybar




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
