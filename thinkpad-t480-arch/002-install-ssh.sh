## 02-install-ssh.sh

## This script allows the ability to install ssh on the thinkpad-t480
## as well as configuring ssh as well. Obviously the ssh thing in arch linux
## is sometimes pre-installed but just to make sure it is there. That's pretty
## much the script. 

sudo pacman -Sy --noconfirm
sudo pacman -S openssh --noconfirm