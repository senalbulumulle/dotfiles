## windows 10 ltsc setup script
## this script is used to setup the windows 10 ltsc environment
## using senal's dotfiles

clear
echo "Starting Senal dotfiles on Windows 10 LTSC..."
sleep 4
clear

scoop bucket add extras
scoop install neovim                                            
scoop bucket add nerd-fonts                                    
scoop install neovide                                           
