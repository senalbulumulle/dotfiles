## This script Uninstalls apps/dependencies for my config and more


## Making sure the APT repositories/packages are updated
sudo apt update -y && sudo apt upgrade -y


## Removes the Firefox Browser 
sudo apt purge firefox -y


## Removes the Firefox ESR Browser 
sudo apt purge firefox-esr -y


## Uninstalls Librewolf 

## https://librewolf.net/
## https://gitlab.com/librewolf-community
## https://librewolf.net/installation/debian/

echo "deb [arch=amd64] http://deb.librewolf.net $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/librewolf.list
sudo wget https://deb.librewolf.net/keyring.gpg -O /etc/apt/trusted.gpg.d/librewolf.gpg
sudo apt purge librewolf -y




## Uninstalls Kitty

## https://sw.kovidgoyal.net/kitty/
## https://github.com/kovidgoyal/kitty	

sudo apt purge kitty -y


## Uninstalls Neofetch 

## https://github.com/dylanaraps/neofetch

sudo apt purge neofetch -y



## Uninstalls Ranger 

## https://github.com/ranger/ranger
## https://ranger.github.io/

sudo apt purge ranger -y


## Uninstalls fish 

## https://fishshell.com/
## https://github.com/fish-shell/fish-shell


sudo apt purge fish -y




## Uninstalls Micro Editor 

## https://micro-editor.github.io/
## https://github.com/zyedidia/micro

sudo apt purge micro -y




## Uninstalls neovim

## https://neovim.io/
## https://github.com/neovim

sudo apt purge neovim -y




## Uninstalls vim

## https://www.vim.org/
## https://github.com/vim

sudo apt purge vim -y




## Uninstalls rofi

## https://github.com/davatorium/rofi

sudo apt purge rofi -y



## Uninstalls tint2

## https://gitlab.com/o9000/tint2
## https://github.com/o9000/tint2


sudo apt purge tint2 -y 





## Uninstalls i3

## https://github.com/i3/i3
## https://github.com/Airblader/i3
## https://i3wm.org/


sudo apt purge i3 -y 




## Uninstalls OpenBox

## https://github.com/danakj/openbox


sudo apt purge openbox -y 



## Uninstalls Nitrogen

## https://nitrogenproject.com/

## https://github.com/nitrogen/nitrogen


sudo apt purge nitrogen -y 



## Uninstalls picom

## https://github.com/yshui/picom

sudo apt purge picom -y 




## Uninstalls Polybar

## https://github.com/polybar/polybar
## https://polybar.github.io/

sudo apt purge polybar -y 


## Uninstalls xfce4

## https://xfce.org/

## https://gitlab.xfce.org/explore/groups?sort=name_desc

sudo apt purge xfce4 -y 


## Uninstalls notes 

## https://github.com/pimterry/notes

curl -Ls https://raw.githubusercontent.com/pimterry/notes/latest-release/install.sh | sudo bash



## Uninstalls Configuration Files 
cd Pop!_OS && sh configure.sh
