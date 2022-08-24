###########################################################
##      Search: Debian
###########################################################



## After the user chooses Debian, then it will install the 
## dependencies for my config in Debian, if not, it will 
## restart the script to go back to the main menu. 

		
2)
## Making sure the APT repositories/packages are updated
sudo apt update -y  && sudo apt upgrade -y



## Installs i3

## https://i3wm.org/

## https://github.com/i3

sudo apt install i3 -y

				


## Installs notes 

## https://github.com/pimterry/notes

curl -Ls https://raw.githubusercontent.com/pimterry/notes/latest-release/install.sh | sudo bash


## Installs Configuration Files 
cd debian
sh configure.sh 
                                
clear
echo """
Welcome to Senal's Config Installer 
------------------------------------
Type [options] to see more information
				"""
;;
