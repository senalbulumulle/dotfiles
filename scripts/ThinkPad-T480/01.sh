## setup-laptop-thinkpad-t480
## setup minimal setup as a dedicated writing machine


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
}


function enableServices()
{
	echo "enable services"	
}
