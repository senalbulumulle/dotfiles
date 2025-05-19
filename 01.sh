## setup-laptop-thinkpad-t480
## setup minimal setup as a dedicated writing machine



## Why, when I'm studying or writing books down, I use the ThinkPad T480. 


function updatePackages()
{
	sudo pacman -Syyu --noconfirm
}
updatePackages


function uninstallApps()
{
	echo "none"
}
uninstallApps

function installApps()
{
        sudo pacman -S neovim --noconfirm
        sudo pacman -S i3 --noconfirm
        sudo pacman -S dmenu --noconfirm
        sudo pacman -S emacs --noconfirm
        sudo pacman -S github-cli --noconfirm
        sudo pacman -S git --noconfirm
        sudo pacman -S emacs --noconfirm
        sudo pacman -S polybar --noconfirm
        sudo pacman -S xorg-xinit --noconfirm
        sudo pacman -S xorg --noconfirm
        sudo pacman -S git --noconfirm
        sudo pacman -S github-cli --noconfirm
}
installApps

function enableServices()
{
	echo "enable services"	
}
enableServices


echo "exec i3" > ~/.xinitrc