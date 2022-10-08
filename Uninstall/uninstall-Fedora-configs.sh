## Making sure the DNF repositories/packages are updated
sudo dnf update && sudo dnf upgrade 


## Uninstalls the RPM Sphere 

## https://rpmsphere.github.io/

## https://github.com/rpmsphere

#wget https://github.com/rpmsphere/noarch/raw/master/r/rpmsphere-release-36-1.noarch.rpm
#sudo rpm -i -y rpmsphere-release-36.1.noarch.rpm


## Uninstalls MarkText

## https://github.com/marktext/marktext

## https://marktext.app/

#wget https://github.com/marktext/marktext/releases/download/v0.17.1/marktext-x86_64.rpm
#sudo rpm -i -y marktext-x86_64.rpm


## Uninstalls Kitty

## https://sw.kovidgoyal.net/kitty/
## https://github.com/kovidgoyal/kitty	

sudo dnf -y remove kitty


## Uninstalls Neofetch 

## https://github.com/dylanaraps/neofetch

sudo dnf -y remove neofetch


## Removes Firefox 

sudo dnf -y erase firefox

## Uninstalls Ranger 

## https://github.com/ranger/ranger
## https://ranger.github.io/

sudo dnf -y remove ranger


## Uninstalls fish 

## https://fishshell.com/
## https://github.com/fish-shell/fish-shell


sudo dnf -y remove fish




## Uninstalls Micro Editor 

## https://micro-editor.github.io/
## https://github.com/zyedidia/micro

sudo dnf -y remove micro




## Uninstalls neovim

## https://neovim.io/
## https://github.com/neovim

sudo dnf -y remove neovim




## Uninstalls vim

## https://www.vim.org/
## https://github.com/vim

sudo dnf -y remove vim








## Uninstalls OpenBox

## https://github.com/danakj/openbox


sudo dnf -y remove openbox







## Uninstalls Nitrogen

## https://nitrogenproject.com/

## https://github.com/nitrogen/nitrogen


sudo dnf -y remove nitrogen



## Uninstalls Librewolf

## https://librewolf.net/

## https://gitlab.com/librewolf-community

## https://librewolf.net/installation/fedora/


sudo rpm --import https://keys.openpgp.org/vks/v1/by-fingerprint/034F7776EF5E0C613D2F7934D29FBD5F93C0CFC3

sudo dnf config-manager --add-repo https://rpm.librewolf.net

sudo dnf update

sudo dnf -y remove librewolf




## Uninstalls picom

## https://github.com/yshui/picom

sudo dnf -y remove picom



## Uninstalls Polybar

## https://github.com/polybar/polybar
## https://polybar.github.io/

sudo dnf -y remove polybar


## Uninstalls xfce4

## https://xfce.org/

## https://gitlab.xfce.org/explore/groups?sort=name_desc

sudo dnf -y remove xfce4


## Uninstalls i3

## https://i3wm.org/

## https://github.com/i3

sudo dnf -y remove i3



## Uninstalls brightnessctl

## https://github.com/Hummer12007/brightnessctl

sudo dnf -y remove brightnessctl


## Uninstalls notes 

## https://github.com/pimterry/notes

#curl -Ls https://raw.githubusercontent.com/pimterry/notes/latest-release/install.sh | sudo bash




## Uninstalls Configuration Files 
#cd Fedora && sh configure.sh
