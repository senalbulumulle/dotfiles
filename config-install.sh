#########################################################
#	Senal's Config Installer Script
#
#
#########################################################

clear

echo """
========================================================================================
		Welcome to Senal's Config Installer
========================================================================================
=
	1) Arch Linux                           [Status: STABLE]

	2) Debian                               [Status: NOT STABLE/RE-MODELING]

	3) Fedora                               [Status: STABLE]

	4) Pop!_OS                              [Status: NOT TESTED]

	5) macOS                                [Status: TESTED/STABLE]

	6) Ubuntu-Multipass                     [STATUS: STABLE]
        
        7) Kali-Linux                           [STATUS: NOT STABLE] [NEW]

	8) Exit
========================================================================================
	


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
                                
                                
				echo """
========================================================================================
		Welcome to Senal's Config Installer
========================================================================================
=
	1) Arch Linux                           [Status: STABLE]

	2) Debian                               [Status: NOT STABLE/RE-MODELING]

	3) Fedora                               [Status: STABLE]

	4) Pop!_OS                              [Status: NOT TESTED]

	5) macOS                                [Status: TESTED/STABLE]

	6) Ubuntu-Multipass                     [STATUS: STABLE]
        
        7) Kali-Linux                           [STATUS: NOT STABLE] [NEW]

	8) Exit
========================================================================================
				"""
			;;

                ###########################################################
                ##      Search: Fedora
                ###########################################################

			
		## After the user chooses Fedora, then it will install the 
		## dependencies for my config in Fedora.

		
		3)
                                sh install-Fedora-configs.sh

				echo """
========================================================================================
		Welcome to Senal's Config Installer
========================================================================================
=
	1) Arch Linux                           [Status: STABLE]

	2) Debian                               [Status: NOT STABLE/RE-MODELING]

	3) Fedora                               [Status: STABLE]

	4) Pop!_OS                              [Status: NOT TESTED]

	5) macOS                                [Status: TESTED/STABLE]

	6) Ubuntu-Multipass                     [STATUS: STABLE]
        
        7) Kali-Linux                           [STATUS: NOT STABLE] [NEW]

	8) Exit
========================================================================================
				"""
			;;



                ###########################################################
                ##      Search: Pop!_OS
                ###########################################################

		## After the user chooses Pop!_OS, then it will install the 
		## dependencies for my config in Pop!_OS. 

	
		4)
                                sh install-Pop!_OS-configs.sh

				echo """
========================================================================================
		Welcome to Senal's Config Installer
========================================================================================
=
	1) Arch Linux                           [Status: STABLE]

	2) Debian                               [Status: NOT STABLE/RE-MODELING]

	3) Fedora                               [Status: STABLE]

	4) Pop!_OS                              [Status: NOT TESTED]

	5) macOS                                [Status: TESTED/STABLE]

	6) Ubuntu-Multipass                     [STATUS: STABLE]
        
        7) Kali-Linux                           [STATUS: NOT STABLE] [NEW]

	8) Exit
========================================================================================
				"""
			;;


                ###########################################################
                ##      Search: macOS
                ###########################################################


		## After the user chooses macOS, then it will install the 
		## dependencies for my config in macOS. 

	
		5)
                                sh install-macOS-configs.sh



				echo """
========================================================================================
		Welcome to Senal's Config Installer
========================================================================================
=
	1) Arch Linux                           [Status: STABLE]

	2) Debian                               [Status: NOT STABLE/RE-MODELING]

	3) Fedora                               [Status: STABLE]

	4) Pop!_OS                              [Status: NOT TESTED]

	5) macOS                                [Status: TESTED/STABLE]

	6) Ubuntu-Multipass                     [STATUS: STABLE]
        
        7) Kali-Linux                           [STATUS: NOT STABLE] [NEW]

	8) Exit
========================================================================================
				"""		
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
			exit
			;;


		*)
			echo """
			
			"""
esac
done
