##################
## kde-desktop.sh 
##################


## Installs pacman packages 
sudo pacman -S plasma         --noconfirm
sudo pacman -S polybar        --noconfirm
sudo pacman -S discord        --noconfirm
sudo pacman -S ranger         --noconfirm
sudo pacman -S fish           --noconfirm
sudo pacman -S github-cli     --noconfirm
sudo pacman -S micro          --noconfirm
sudo pacman -S base           --noconfirm
sudo pacman -S xorg-server    --noconfirm
sudo pacman -S okular         --noconfirm
sudo pacman -S libreoffice    --noconfirm
sudo pacman -S chromium       --noconfirm
sudo pacman -S php 		  	  --noconfirm
sudo pacman -S python-pip     --noconfirm
sudo pacman -S neovim         --noconfirm

## Installs the yay helper 
git clone https://aur.archlinux.org/yay-bin
cd yay-bin
makepkg -si 
cd ..
rm -rf yay-bin


yay -S ungoogled-chromium --noconfirm




pip install mediapipe
pip install flask
pip install opencv-python
