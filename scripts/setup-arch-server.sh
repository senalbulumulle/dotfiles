## setup-arch-server.sh
## This script is used to create a Arch based Server


function updatePackages()
{
	sudo pacman -Syyu --noconfirm
}
updatePackages


function installApps()
{
	sudo pacman -S cockpit
}


function enableServices()
{
	sudo pacman -S cockpit --noconfirm
	sudo pacman -S cockpit-machines --noconfirm
	sudo pacman -S cockpit-files --noconfirm
	sudo pacman -S cockpit-package-kit --noconfirm	
}
