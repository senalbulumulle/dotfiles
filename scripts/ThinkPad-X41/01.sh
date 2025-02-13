## setup-laptop-thinkpad-X41
## setup minimal setup as a dedicated writing machine


## TASKS:

## - Make a command in dmenu that allows to use other devices to write stuff remotely



function updatePackages()
{
	sudo pacman -Syyu --noconfirm
}
updatePackages


function uninstallApps()
{
	echo "none"
}


function installApps()
{
	sudo pacman -S neovim --noconfirm
    sudo pacman -S i3 --noconfirm
    sudo pacman -S dmenu --noconfirm
    sudo pacman -S emacs --noconfirm
    sudo pacman -S github-cli --noconfirm
    sudo pacman -S git --noconfirm
}


function enableServices()
{
	echo "enable services"	
}
