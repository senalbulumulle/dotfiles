## After the user chooses Debian, then it will install the 
## dependencies for my config in Debian, if not, it will 
## restart the script to go back to the main menu. 


## Making sure the APT repositories/packages are updated
sudo apt update -y  && sudo apt upgrade -y



## Uninstalls i3

## https://i3wm.org/

## https://github.com/i3

sudo apt purge i3 -y
