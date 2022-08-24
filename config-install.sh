############################################################
#       Installation Script
#
#
############################################################


# !bin/env bash

function introduction() {
	clear
	echo """
	########################################################################################
	##      Welcome to Senal's dotfiles                                                    #
	########################################################################################
	########################################################################################
	##      Options                                                                        #
	##                                                                                     #
	########################################################################################
	########################################################################################
	##	Exiting the program
	##
	##
	##	Type 'exit' to exit the program
	########################################################################################
	"""

}



function getChoices() {
	while :
		do
		read CHOICE

		case $CHOICE in
			##################################################################
			##      Search: options
			##
			##################################################################
			## If the user types options, then it display the list of options

			options)
				sh options.sh
				;;


			##################################################################
			##      Search: install-gnome-desktop
			##
			##################################################################
			## If the user presses 1), then it will install the GNOME-Desktop Environment.

			1)
				sh install-gnome-desktop.sh

				;;
			##################################################################
			##      Search: uninstall-gnome-desktop
			##
			##################################################################

			## If the user presses 2), then it will uninstall the GNOME-Desktop Environment.

			2)

				sh uninstall-gnome-desktop.sh

				;;
			##################################################################
			##      Search: install-kde-desktop
			##
			##################################################################

                        ## If the user presses 3), then it will install the KDE-Desktop Environment.

			3)

				sh install-kde-desktop.sh
				;;

			##################################################################
			##      Search: uninstall-kde-desktop
			##
			##################################################################

                        ## If the user presses 4), then it will uninstall the KDE-Desktop-Environment

			4)
				sh uninstall-kde-desktop.sh

				;;

			##################################################################
			##      Search: install-lxqt-desktop
			##
			##################################################################

                        ## If the user presses 4), then it will install the LXQT-Desktop-Environment

			5)
				sh install-lxqt-desktop.sh

				;;

			##################################################################
			##      Search: uninstall-lxqt-desktop
			##
			##################################################################

                        ## If the user presses 4), then it will uninstall the LXQT-Desktop-Environment

			6)
				sh uninstall-lxqt-desktop.sh

				;;

			##################################################################
			##      Search: install-xfce4-desktop
			##
			##################################################################

                        ## If the user presses 4), then it will install the XFCE4-Desktop-Environment

			7)
				sh install-xfce4-desktop.sh

				;;


			##################################################################
			##      Search: uninstall-xfce4-desktop
			##
			##################################################################

                        ## If the user presses 4), then it will uninstall the XFCE4-Desktop-Environment

			8)
				sh uninstall-xfce4-desktop.sh

				;;

			##################################################################
			##      Search: install-cinnamon-desktop
			##
			##################################################################

                        ## If the user presses 4), then it will install the Cinnamon-Desktop-Environment

			9)
				sh install-cinnamon-desktop.sh

				;;

        
			##################################################################
			##      Search: uninstall-cinnamon-desktop
			##
			##################################################################

                        ## If the user presses 4), then it will uninstall the Cinnamon-Desktop-Environment

			10)
				sh uninstall-cinnamon-desktop.sh

				;;














	#			▼▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲►        ▲ ▼▼           ▼▲▲▼      ►▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲►           ►▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲►
	#			◄▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼►         ▼▲▼▼▼         ◄▼▼▼▼      ►▼▼▼▼►►►►►▼▼▼▼▼▼►           ►▼▼►►►►►►▼▼▼▼►►►▼▼►
	#			◄▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼          ▼▼▼▼▼      ▼▼ ◄▼▼            ◄▼▼▼▼►                    ▼▼▼▼►►▼▼▼▼▼▼▼
	#			◄▼▼▼▼►                           ▼▼▼▼▼    ▼▼▼▲▼              ◄▼▼▼▼►                        ◄▼▼►
	#			◄▼▼▼▼►                            ▼▼▼▼▼  ▼▼▼▼▼               ◄▼▼▼▼►                        ◄▼▼►
	#			◄▼▼▼▼►                             ▼▼▼▼▲▲▼▼▼▼                ◄▼▼▼▼►                        ◄▼►►
	#			◄▼▼▼▼►                              ▼▼▼▼▼▼▼                  ◄▼▼▼▼►                        ◄▼►►
	#			◄▼▼▼▼▼▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲►              ▼ ◄▼▼                   ◄▼▼▼▼►                        ◄▼►►
	#			◄▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼►                ▼▼▼                    ◄▼▼▼▼►                        ◄▼►►
	#			◄▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼                ◄►                     ◄▼▼▼▼►                        ◄▼►►
	#			◄▼▼▼▼►                              ▼▲▼▼▼                    ◄▼▼▼▼►                        ◄▼►►
	#			◄▼▼▼▼►                             ▼▼▼▼▼▼▼                   ◄▼▼▼▼►                        ◄▼►►
	#			◄▼▼▼▼►                             ◄▼▼▼▼▼▼▼                  ◄▼▼▼▼►                        ◄▼►►
	#			◄▼▼▼▼▼▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▼         ▼▲▼▼▼▼▼▼▼▼▼                 ◄▼▼▼▼►                        ◄▼►►
	#			◄▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼►        ▼▼▼▼▼▼ ▼▼► ▼                 ◄▼▼▼▼►                        ◄▼▼►
	#			◄▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼►       ▼▼▼▼▼    ▼▼▲▼▼           ►▲▲▲▲▼▲►►►▲▲▲▲▲▲►                  ◄▼▼►
	#			▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼     ◄►▼▼▼       ▼▼▼▼►          ◄▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼►                  ◄▼▼►





			## After the user types 'exit', it will exit the program

			exit)
				exit
				;;



			## If the user presses a unknown character, it will inform
			## the user to choose the correct commands.
			*)
				echo """

	########################################################################################
	##      Welcome to Senal's dotfiles                                                    #
	########################################################################################
	########################################################################################
	##      Options                                                                        #
	##                                                                                     #
	########################################################################################
	########################################################################################
	##	Exiting the program
	##
	##
	##	Type 'exit' to exit the program
	########################################################################################				
				"""
	esac
	done


}




introduction
getChoices
