#################################################################
##		fixmykeys.sh
##
##
#################################################################


sudo pacman -S --noconfirm gnupg


sudo pacman -Sy --noconfirm archlinux-keyring
sudo pacman-key --noconfirm --populate archlinux
sudo pacman-key --noconfirm --refresh-keys
sudo pacman -Syu --noconfirm 
sudo pacman -Syyu --noconfirm
