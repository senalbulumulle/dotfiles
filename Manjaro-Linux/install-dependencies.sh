## install-dependencies

sudo pacman -S kitty --noconfirm
sudo pacman -S ranger --noconfirm
sudo pacman -S vim --noconfirm
sudo pacman -S neovim --noconfirm
sudo pacman -S micro --noconfirm
sudo pacman -S zsh --noconfirm
sudo pacman -S neofetch --noconfirm
sudo pacman -S discord --noconfirm
sudo pacman -S yay --noconfirm

yay -S librewolf-bin --noconfirm
yay -S vscodium-bin --noconfirm


cp .bashrc /home/$USER/ 
cp fish /home/$USER/.config
cp micro /home/$USER/.config
cp ranger /home/$USER/.config
cp neofetch /home/$USER/.config
