q#########################################################
#	Senal's Config Installer Script
#
#
#########################################################

clear

echo """
=====================================
Welcome to Senal's Config Installer
=====================================
Please type [options]
to see the list of options

To exit, please type [off]
	


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
				
                                sh Install/install-Arch-Linux-configs.sh
			;;


                ###########################################################
                ##      Search: Debian
                ###########################################################



		## After the user chooses Debian, then it will install the 
		## dependencies for my config in Debian, if not, it will 
		## restart the script to go back to the main menu. 

		
		2)
                                sh Install/install-Debian-configs.sh
			;;

                ###########################################################
                ##      Search: Fedora
                ###########################################################

			
		## After the user chooses Fedora, then it will install the 
		## dependencies for my config in Fedora.

		
		3)
                                sh Install/install-Fedora-configs.sh
			;;



                ###########################################################
                ##      Search: Pop!_OS
                ###########################################################

		## After the user chooses Pop!_OS, then it will install the 
		## dependencies for my config in Pop!_OS. 

	
		4)
                                sh Install/install-Pop!_OS-configs.sh
			;;


                ###########################################################
                ##      Search: macOS
                ###########################################################


		## After the user chooses macOS, then it will install the 
		## dependencies for my config in macOS. 

	
		5)
                                sh Install/install-macOS-configs.sh		
			;;		



                ###########################################################
                ##      Search: Ubuntu-Multipass
                ###########################################################


		## After the user chooses Ubuntu-Multipass, then it will install the 
		## dependencies for my config in Ubuntu-Multipass. 

		6)
                                sh Install/install-Ubuntu-Multipass.sh
			;;






                ###########################################################
                ##      Search: Kali-Linux
                ###########################################################

		## After the user chooses Kali-Linux, then it will install the 
		## dependencies for my config in Kali-Linux. 

	
		7)
					
                                sh Install/install-Kali-Linux-configs.sh
			;;






                ###########################################################
                ##      Search: Ubuntu-Linux
                ###########################################################

		## After the user chooses Ubuntu-Linux, then it will install the 
		## dependencies for my config in Ubuntu-Linux. 

	
		8)
					
                                sh Install/install-Ubuntu-Linux-configs.sh
			;;



                ###########################################################
                ##      Search: Garuda-Linux
                ###########################################################

		## After the user chooses Garuda-Linux, then it will install the 
		## dependencies for my config in Garuda-Linux. 

	
		9)
					
                                sh Install/install-Garuda-Linux-configs.sh
			;;


		options)
			bash options.sh
			;;


		off)
			exit	
			;;


		*)
			echo """
			
			"""
esac
done
