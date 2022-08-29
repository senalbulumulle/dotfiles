
#########################################################
#	Senal's Config Installer Script
#		Classic Edition
#
#########################################################

clear

echo """
=====================================
Welcome to Senal's Config Installer
=====================================
1) Install Arch Linux Configs 
2) Install Debian Configs
3) Install Fedora Configs 
4) Install Pop!_OS Configs
5) Install macOS Configs
6) Install Ubuntu-Multipass Configs
7) Install Kali-Linux Configs
8) Exit the program

"""
while :
	do 
	read CHOICE

	case $CHOICE in 

                ###########################################################
                ##      Search: Arch-Linux
                ###########################################################

		## After the user chooses Arch-Linux, then it will install the 
		## dependencies for my config in Arch-Linux, if not, it will 
		## restart the script to go back to the main menu. 
		
		1)
				
                                sh install-Arch-Linux-configs.sh
			;;


                ###########################################################
                ##      Search: Debian
                ###########################################################



		## After the user chooses Debian, then it will install the 
		## dependencies for my config in Debian, if not, it will 
		## restart the script to go back to the main menu. 

		
		2)
                                sh install-Debian-configs.sh
			;;

                ###########################################################
                ##      Search: Fedora
                ###########################################################

			
		## After the user chooses Fedora, then it will install the 
		## dependencies for my config in Fedora.

		
		3)
                                sh install-Fedora-configs.sh
			;;



                ###########################################################
                ##      Search: Pop!_OS
                ###########################################################

		## After the user chooses Pop!_OS, then it will install the 
		## dependencies for my config in Pop!_OS. 

	
		4)
                                sh install-Pop!_OS-configs.sh
			;;


                ###########################################################
                ##      Search: macOS
                ###########################################################


		## After the user chooses macOS, then it will install the 
		## dependencies for my config in macOS. 

	
		5)
                                sh install-macOS-configs.sh		
			;;		



                ###########################################################
                ##      Search: Ubuntu-Multipass
                ###########################################################


		## After the user chooses Ubuntu-Multipass, then it will install the 
		## dependencies for my config in Ubuntu-Multipass. 

		6)
                                sh install-Ubuntu-Multipass.sh
			;;






                ###########################################################
                ##      Search: Kali-Linux
                ###########################################################

		## After the user chooses Kali-Linux, then it will install the 
		## dependencies for my config in Kali-Linux. 

	
		7)
					
                                sh install-Kali-Linux-configs.sh
			;;


		8)
			return 0
			;;


		*)
			echo """
			
			"""
esac
done
