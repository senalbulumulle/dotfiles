#########################################################
#	Senal's Config Installer Script
#
#
#########################################################

clear

echo """
____________________________________

Welcome to Senal's Config Installer!
____________________________________

____________________________________________________

Choose the OS to install dependencies for my config
____________________________________________________


	* Arch Linux		(1)
	
	* Debian		(2)

	* Fedora 		(3)

	* Pop!_OS		(4)

	* EXIT THE PROGRAM 	(5)	
	


"""
while :
	do 
	read CHOICE

	case $CHOICE in 

		## After the user chooses Arch-Linux, then it will install the 
		## dependencies for my config in Arch-Linux, if not, it will 
		## restart the script to go back to the main menu. 
		
		1)
			cd Arch-Linux/ && sh config-install.sh
			cd ../
			;;


		## After the user chooses Debian, then it will install the 
		## dependencies for my config in Debian, if not, it will 
		## restart the script to go back to the main menu. 

		
		2)
			cd Debian/ && sh config-install.sh
			cd ../
			;;



			
		## After the user chooses Fedora, then it will install the 
		## dependencies for my config in Fedora.

		
		3)
			cd Fedora/ && sh config-install.sh
			cd ../
			;;


		## After the user chooses Pop!_OS, then it will install the 
		## dependencies for my config in Pop!_OS. 

	
		4)
			cd Pop!_OS/ && sh config-install.sh
			cd ../
			;;



		## After the user types 'exit', it will exit the program

		5)
			exit
			;;
			


		## If the user presses a unknown character, it will inform
		## the user to choose the correct commands. 
		*)
			echo """
			*****************************************************
			*	Unknown! Please Try Again!
			*
			*****************************************************
			__________________________________________________
			
			Choose the OS to install dependencies for my config
			____________________________________________________
			
			
				* Arch Linux		(1)
				
				* Debian		(2)
			
				* Fedora 		(3)
			
				* Pop!_OS		(4)

				* Exit the Program      (5)

				
			*****************************************************
			"""
esac
done
