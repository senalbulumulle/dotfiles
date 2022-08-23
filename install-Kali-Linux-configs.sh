                ###########################################################
                ##      Search: Kali-Linux
                ###########################################################

		## After the user chooses Kali-Linux, then it will install the 
		## dependencies for my config in Kali-Linux. 

	
		7)
				## This script installs apps/dependencies for my config and more


				## Making sure the APT repositories/packages are updated
				sudo apt update -y && sudo apt upgrade -y


				## Uninstall XFCE4-desktop
				sudo apt purge xfce4


                                ## Installs i3

                                ## https://i3wm.org/

                                ## https://github.com/i3

                                sudo apt install i3 -y



				## Installs rofi

				## https://github.com/davatorium/rofi

				sudo apt install rofi -y

                                




                                ## Installs openjdk

                                ## https://jdk.java.net/

                                ## https://github.com/openjdk
                                sudo apt install openjdk -y



				## Installs fish 

				## https://fishshell.com/
				## https://github.com/fish-shell/fish-shell


				sudo apt install fish -y



				## Removes some default .configs
				cd /home/$USER/.config
				rm -rf *

				



                                ## Installs Configuration Files 
                                cd Kali-Linux && sh configure.sh
