## setup-laptop-server.sh
## This script is used to create a Arch based laptop configuration


function updatePackages()
{
	sudo pacman -Syyu --noconfirm
}
updatePackages


function installApps()
{
	sudo pacman -S visual-studio-code --noconfirm
	sudo pacman -S neovim --noconfirm
}


function enableServices()
{
	echo "enable services"	
}
