## arch-install.sh



## This will update and upgrade the packages 
sudo pacman -Syyu --noconfirm



## This will install the virt-manager thing
sudo pacman -S libvirt --noconfirm
sudo pacman -S qemu --noconfirm
sudo pacman -S virt-manager --noconfirm


## Enable the virtualization services thing
sudo systemctl enable libvirt



## This will install the terminal emulators
sudo pacman -S alacritty --noconfirm
sudo pacman -S kitty --noconfirm
sudo pacman -S xterm --noconfirm
