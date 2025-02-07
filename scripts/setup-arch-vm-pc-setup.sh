## setup-arch-vm-pc-setup.sh
## This script is used to create a Arch based laptop configuration


function updatePackages()
{
	sudo pacman -Syyu --noconfirm
}
updatePackages


function uninstallApps()
{
	sudo pacman -Rcns visual-studio-code --noconfirm
}


function installApps()
{
	sudo pacman -S neovim --noconfirm
	yay -S vmware --noconfirm
}


function enableServices()
{
	echo "enable services"	
}



function reboot()
{
	sudo reboot
}
