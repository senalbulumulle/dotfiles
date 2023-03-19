##
#	-----------------
#	archlinuxsetup.sh
#  	------------------
#  
#
#

sudo pacman -S --noconfirm i3
sudo pacman -S --noconfirm i3lock i3status dmenu feh xorg-xrandr
sudo pacman -S --noconfirm ranger --noconfirm
sudo pacman -S --noconfirm tint2 --noconfirm
sudo pacman -S --noconfirm kitty --no-confirm 
sudo pacman -S --noconfirm alacritty --noconfirm 
sudo pacman -S --noconfirm polybar --noconfirm
sudo pacman -S --noconfirm micro --noconfirm
sudo pacman -S --noconfirm libvirt --noconfirm 
sudo pacman -S discord --noconfirm
sudo pacman -S gnome-software --noconfirm
sudo pacman -S power-profiles-daemon
yay -S librewolf-bin --noconfirm
sudo pacman -S gdm --noconfirm
sudo systemctl enable gdm
sudo systemctl enable power-profiles-daemon
sudo gpasswd -a $USER video
sudo systemctl reboot
