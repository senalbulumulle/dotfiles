##
#	-----------------
#	archlinuxsetup.sh
#  	------------------
#  
#
#

sudo pacman -S --noconfirm i3
sudo pacman -S --noconfirm i3lock i3status dmenu feh xorg-xrandr
sudo pacman -S gdm --noconfirm
sudo systemctl enable gdm

sudo gpasswd -a $USER video


sudo systemctl reboot

