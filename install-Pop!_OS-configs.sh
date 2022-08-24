## This script installs apps/dependencies for my config and more


## Making sure the APT repositories/packages are updated
sudo apt update -y && sudo apt upgrade -y


## Removes the Firefox Browser 
sudo apt purge firefox -y


## Removes the Firefox ESR Browser 
sudo apt purge firefox-esr -y


## Installs Librewolf 

## https://librewolf.net/
## https://gitlab.com/librewolf-community
## https://librewolf.net/installation/debian/

echo "deb [arch=amd64] http://deb.librewolf.net $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/librewolf.list
sudo wget https://deb.librewolf.net/keyring.gpg -O /etc/apt/trusted.gpg.d/librewolf.gpg
sudo apt install librewolf -y




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


## Installs notes 

## https://github.com/pimterry/notes

curl -Ls https://raw.githubusercontent.com/pimterry/notes/latest-release/install.sh | sudo bash



## Installs Configuration Files 
cd Pop!_OS && sh configure.sh
