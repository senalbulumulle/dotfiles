## post-install.sh
## In this script, we have the post install script for Senal's configurations 


## Install git 
sudo pacman -S git --noconfirm 


## Install Discord
sudo pacman -S discord --noconfirm


## Install OBS
sudo pacman -S obs --noconfirm


## Install Chrome

yay -S google-chrome --noconfirm



## Install Firefox
sudo pacman -S firefox --noconfirm


## Install Thorium
yay -S thorium-browser-bin --noconfirm


## Install Nautilus
sudo pacman -S nautilus --noconfirm


## Install MarkText 
yay -S marktext-bin --noconfirm


## Install gnome-disks
sudo pacman -S gnome-disk-utility --noconfirm


## Install brightnessctl
sudo pacman -S brightnessctl --noconfirm


## Install Github-CLI
sudo pacman -S github-cli --noconfirm


## Install libvirt
sudo pacman -S libvirt --noconfirm


## Enable the libvirt stuff
sudo systemctl enable libvirtd.service					## Enable the service
sudo systemctl enable libvirtd-admin.socket				## Enable the Admin Socket
sudo systemctl enable libvirt-tcp.socket				## Enable the TCP socket 
sudo systemctl enable libvirt-tls.socket				## Enable the TLS socket 
sudo systemctl enable libvirt-guests.service			## Enable the Guests Service


## Install QEMU Full
sudo pacman -S qemu-full --noconfirm


## Install the Virt-Manager Stuff 
sudo pacman -S virt-manager --noconfirm


## Install the lxpolkit daemon
sudo pacman -S lxsession --noconfirm


## Install the vscodium
yay -S vscodium-bin --noconfirm



## Install Signal 
yay -S signal-desktop-bin --noconfirm


## Install pavucontrol
sudo pacman -S pavucontrol --noconfirm
