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

	2) Debian                               [Status: KINDA STABLE]

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
				
				## Making sure the pacman repositories/packages are updated
				sudo pacman -Syyu

				########################################################################
				##	Credits to Chaotic-AUR
				##
				##	https://aur.chaotic.cx/
				##	
				########################################################################

				sudo pacman-key --recv-key FBA220DFC880C036 --keyserver keyserver.ubuntu.com                                                                                         && \
				sudo pacman-key --lsign-key FBA220DFC880C036                                                                                                                         && \        
				sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
				sudo cp pacman.conf /etc/pacman.conf	
				sudo pacman -Sy			


				## Installs pamac-classic

				## https://wiki.manjaro.org/index.php/Pamac
				## https://gitlab.manjaro.org/applications/pamac

				sudo pacman -S --noconfirm pamac-classic


				## Installs Librewolf 

				## https://librewolf.net/ 
				## https://gitlab.com/librewolf-community

				sudo pacman -S --noconfirm librewolf


				## Installs ungoogled-chromium

				##  https://github.com/ungoogled-software/ungoogled-chromium-archlinux
				##  https://ungoogled-software.github.io/

				sudo pacman -S --noconfirm ungoogled-chromium


				## Installs Kitty   

				## https://sw.kovidgoyal.net/kitty/
				## https://github.com/kovidgoyal/kitty	

				sudo pacman -S --noconfirm kitty 


				## Installs Neofetch 

				## https://github.com/dylanaraps/neofetch

				sudo pacman --S --noconfirm neofetch 



				## Installs Ranger 

				## https://github.com/ranger/ranger
				## https://ranger.github.io/

				sudo pacman  -S --noconfirm ranger 


				## Installs fish 

				## https://fishshell.com/
				## https://github.com/fish-shell/fish-shell


				sudo pacman -S --noconfirm fish 




				## Installs Micro Editor 

				## https://micro-editor.github.io/
				## https://github.com/zyedidia/micro

				sudo pacman -S --noconfirm micro 




				## Installs neovim

				## https://neovim.io/
				## https://github.com/neovim

				sudo pacman -S --noconfirm neovim 




				## Installs vim

				## https://www.vim.org/
				## https://github.com/vim

				sudo pacman -S --noconfirm vim 




				## Installs rofi

				## https://github.com/davatorium/rofi

				sudo pacman -S --noconfirm rofi 



				## Installs tint2

				## https://gitlab.com/o9000/tint2
				## https://github.com/o9000/tint2


				sudo pacman -S --noconfirm tint2 





				## Installs i3

				## https://github.com/i3/i3
				## https://github.com/Airblader/i3
				## https://i3wm.org/


				sudo pacman -S --noconfirm i3 




				## Installs OpenBox

				## https://github.com/danakj/openbox


				sudo pacman -S --noconfirm openbox 




				## Installs GitHub-CLI

				## https://cli.github.com/
				## https://github.com/cli/cli


				sudo pacman -S --noconfirm github-cli




				## Installs picom

				## https://github.com/yshui/picom

				sudo pacman -S --noconfirm picom



				## Installs Polybar

				## https://github.com/polybar/polybar
				## https://polybar.github.io/

				sudo pacman -S --noconfirm polybar 




				## Installs xfce4

				## https://xfce.org/

				## https://gitlab.xfce.org/explore/groups?sort=name_desc

				sudo pacman -S --noconfirm xfce4



				## Installs Helix-Editor

				## https://helix-editor.com/

				## https://github.com/helix-editor/helix

				sudo pacman -S --noconfirm helix


				## Installs nwg-bar

				## https://github.com/nwg-plor/nwg-bar

				sudo pacman -S --noconfirm nwg-bar


				## Installs Nitrogen

				sudo pacman -S --noconfirm nitrogen


				## Installs PHP

				## https://www.php.net/
				## https://github.com/php/

				sudo pacman -S --noconfirm php


				## Installs notes 

				## https://github.com/pimterry/notes

				curl -Ls https://raw.githubusercontent.com/pimterry/notes/latest-release/install.sh | sudo bash


                                ## Installs Configuration Files 
                                cd Arch-Linux 
                                sh configure.sh

				echo """
========================================================================================
		Welcome to Senal's Config Installer
========================================================================================
=
	1) Arch Linux                           [Status: STABLE]

	2) Debian                               [Status: KINDA STABLE]

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

                                ## Stash the temp repositories 
                                git stash -u 
                                
                                
				echo """
========================================================================================
		Welcome to Senal's Config Installer
========================================================================================
=
	1) Arch Linux                           [Status: STABLE]

	2) Debian                               [Status: KINDA STABLE]

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
				## Making sure the DNF repositories/packages are updated
				sudo dnf update && sudo dnf upgrade 

                                ## Enable the free repositories

                                ## https://docs.fedoraproject.org/en-US/quick-docs/setup_rpmfusion/

                                sudo dnf -y install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm


                                ## Enable the non-free repositories 

                                ## https://docs.fedoraproject.org/en-US/quick-docs/setup_rpmfusion/

                                sudo dnf -y install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm


                                ## Installs the RPM Sphere 

                                ## https://rpmsphere.github.io/

                                ## https://github.com/rpmsphere

                                wget https://github.com/rpmsphere/noarch/raw/master/r/rpmsphere-release-36-1.noarch.rpm
                                sudo rpm -i -y rpmsphere-release-36.1.noarch.rpm


                                ## Installs MarkText

                                ## https://github.com/marktext/marktext

                                ## https://marktext.app/

                                wget https://github.com/marktext/marktext/releases/download/v0.17.1/marktext-x86_64.rpm
                                sudo rpm -i -y marktext-x86_64.rpm


				## Installs Kitty

				## https://sw.kovidgoyal.net/kitty/
				## https://github.com/kovidgoyal/kitty	

				sudo dnf -y install kitty


				## Installs Neofetch 

				## https://github.com/dylanaraps/neofetch

				sudo dnf -y install neofetch


				## Removes Firefox 

				sudo dnf -y erase firefox

				## Installs Ranger 

				## https://github.com/ranger/ranger
				## https://ranger.github.io/

				sudo dnf -y install ranger


				## Installs fish 

				## https://fishshell.com/
				## https://github.com/fish-shell/fish-shell


				sudo dnf -y install fish




				## Installs Micro Editor 

				## https://micro-editor.github.io/
				## https://github.com/zyedidia/micro

				sudo dnf -y install micro




				## Installs neovim

				## https://neovim.io/
				## https://github.com/neovim

				sudo dnf -y install neovim




				## Installs vim

				## https://www.vim.org/
				## https://github.com/vim

				sudo dnf -y install vim








				## Installs OpenBox

				## https://github.com/danakj/openbox


				sudo dnf -y install openbox







				## Installs Nitrogen

				## https://nitrogenproject.com/

				## https://github.com/nitrogen/nitrogen


				sudo dnf -y install nitrogen



				## Installs Librewolf

				## https://librewolf.net/

				## https://gitlab.com/librewolf-community

				## https://librewolf.net/installation/fedora/


				sudo rpm --import https://keys.openpgp.org/vks/v1/by-fingerprint/034F7776EF5E0C613D2F7934D29FBD5F93C0CFC3

				sudo dnf config-manager --add-repo https://rpm.librewolf.net

				sudo dnf update

				sudo dnf -y install librewolf




				## Installs picom

				## https://github.com/yshui/picom

				sudo dnf -y install picom



				## Installs Polybar

				## https://github.com/polybar/polybar
				## https://polybar.github.io/

				sudo dnf -y install polybar


				## Installs xfce4

				## https://xfce.org/

				## https://gitlab.xfce.org/explore/groups?sort=name_desc

				sudo dnf -y install xfce4


                                ## Installs i3

                                ## https://i3wm.org/

                                ## https://github.com/i3

                                sudo dnf -y install i3



				## Installs brightnessctl

				## https://github.com/Hummer12007/brightnessctl

				sudo dnf -y install brightnessctl



				## Installs nwg-launchers 

				## https://github.com/nwg-piotr/nwg-launchers

				sudo dnf -y install nwg-launchers


				## Installs notes 

				## https://github.com/pimterry/notes

				curl -Ls https://raw.githubusercontent.com/pimterry/notes/latest-release/install.sh | sudo bash




                                ## Installs Configuration Files 
                                cd Fedora && sh configure.sh

				echo """
========================================================================================
		Welcome to Senal's Config Installer
========================================================================================
=
	1) Arch Linux                           [Status: STABLE]

	2) Debian                               [Status: KINDA STABLE]

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
				## This script installs apps/dependencies for my config and more


				## Making sure the APT repositories/packages are updated
				sudo apt update -y && sudo apt upgrade -y


				## Removes the Firefox Browser 
				sudo apt purge firefox -y


                                ## Removes the Firefox ESR Browser 
                                sudo apt purge firefox-esr -y



				## Installs Librewolf 

				## https://librewolf.net/
				## https://gitlab.com/librewolf-community
				## https://librewolf.net/installation/debian/

				echo "deb [arch=amd64] http://deb.librewolf.net $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/librewolf.list
				sudo wget https://deb.librewolf.net/keyring.gpg -O /etc/apt/trusted.gpg.d/librewolf.gpg
				sudo apt install librewolf -y




				## Installs Kitty

				## https://sw.kovidgoyal.net/kitty/
				## https://github.com/kovidgoyal/kitty	

				sudo apt install kitty -y


				## Installs Neofetch 

				## https://github.com/dylanaraps/neofetch

				sudo apt install neofetch -y



				## Installs Ranger 

				## https://github.com/ranger/ranger
				## https://ranger.github.io/

				sudo apt install ranger -y


				## Installs fish 

				## https://fishshell.com/
				## https://github.com/fish-shell/fish-shell


				sudo apt install fish -y




				## Installs Micro Editor 

				## https://micro-editor.github.io/
				## https://github.com/zyedidia/micro

				sudo apt install micro -y




				## Installs neovim

				## https://neovim.io/
				## https://github.com/neovim

				sudo apt install neovim -y




				## Installs vim

				## https://www.vim.org/
				## https://github.com/vim

				sudo apt install vim -y




				## Installs rofi

				## https://github.com/davatorium/rofi

				sudo apt install rofi -y



				## Installs tint2

				## https://gitlab.com/o9000/tint2
				## https://github.com/o9000/tint2


				sudo apt install tint2 -y 





				## Installs i3

				## https://github.com/i3/i3
				## https://github.com/Airblader/i3
				## https://i3wm.org/


				sudo apt install i3 -y 




				## Installs OpenBox

				## https://github.com/danakj/openbox


				sudo apt install openbox -y 



				## Installs Nitrogen

				## https://nitrogenproject.com/

				## https://github.com/nitrogen/nitrogen


				sudo apt install nitrogen -y 



				## Installs picom

				## https://github.com/yshui/picom

				sudo apt install picom -y 




				## Installs Polybar

				## https://github.com/polybar/polybar
				## https://polybar.github.io/

				sudo apt install polybar -y 


				## Installs xfce4

				## https://xfce.org/

				## https://gitlab.xfce.org/explore/groups?sort=name_desc

				sudo apt install xfce4 -y 


				## Installs notes 

				## https://github.com/pimterry/notes

				curl -Ls https://raw.githubusercontent.com/pimterry/notes/latest-release/install.sh | sudo bash



                                ## Installs Configuration Files 
                                cd Pop!_OS && sh configure.sh

				echo """
========================================================================================
		Welcome to Senal's Config Installer
========================================================================================
=
	1) Arch Linux                           [Status: STABLE]

	2) Debian                               [Status: KINDA STABLE]

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
				## Install the Brew Package Manager

				## https://brew.sh
				## https://github.com/Homebrew
				/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"


				## Installs Librewolf 

				## https://librewolf.net/ 
				## https://gitlab.com/librewolf-community

				brew install librewolf


				## Installs Kitty

				## https://sw.kovidgoyal.net/kitty/
				## https://github.com/kovidgoyal/kitty	

				brew install kitty 


				## Installs Neofetch 

				## https://github.com/dylanaraps/neofetch

				brew install neofetch



				## Installs Ranger 

				## https://github.com/ranger/ranger
				## https://ranger.github.io/

				brew install ranger


				## Installs fish 

				## https://fishshell.com/
				## https://github.com/fish-shell/fish-shell


				brew install fish




				## Installs Micro Editor 

				## https://micro-editor.github.io/
				## https://github.com/zyedidia/micro

				brew install micro




				## Installs neovim

				## https://neovim.io/
				## https://github.com/neovim

				brew install neovim




				## Installs vim

				## https://www.vim.org/
				## https://github.com/vim

				brew install vim





				## Installs GitHub-CLI

				## https://cli.github.com/
				## https://github.com/cli/cli


				brew install github-cli	


				## Installs notes 

				## https://github.com/pimterry/notes

				curl -Ls https://raw.githubusercontent.com/pimterry/notes/latest-release/install.sh | sudo bash

				

                                ## Installs Configuration Files 
                                cd macOS && sh configure.sh



				echo """
========================================================================================
		Welcome to Senal's Config Installer
========================================================================================
=
	1) Arch Linux                           [Status: STABLE]

	2) Debian                               [Status: KINDA STABLE]

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
				## Making sure the APT repositories/packages are updated
				sudo apt update -y && sudo apt upgrade -y




				## Installs Kitty

				## https://sw.kovidgoyal.net/kitty/
				## https://github.com/kovidgoyal/kitty	

				sudo apt install kitty -y


				## Installs Neofetch 

				## https://github.com/dylanaraps/neofetch

				sudo apt install neofetch -y



				## Installs Ranger 

				## https://github.com/ranger/ranger
				## https://ranger.github.io/

				sudo apt install ranger -y


				## Installs fish 

				## https://fishshell.com/
				## https://github.com/fish-shell/fish-shell


				sudo apt install fish -y




				## Installs Micro Editor 

				## https://micro-editor.github.io/
				## https://github.com/zyedidia/micro

				sudo apt install micro -y




				## Installs neovim

				## https://neovim.io/
				## https://github.com/neovim

				sudo apt install neovim -y




				## Installs vim

				## https://www.vim.org/
				## https://github.com/vim

				sudo apt install vim -y




				## Installs build-essential
				sudo apt install build-essential -y



				## Installs openjdk

				## https://openjdk.java.net/
				## https://github.com/openjdk
				sudo apt install openjdk -y


				## Installs php 

				## https://www.php.net/
				## https://github.com/php


				sudo apt install php -y



				## Installs nodejs

				## https://nodejs.org/en/
				## https://github.com/nodejs 


				sudo apt install nodejs -y



				## Installs npm 

				## https://www.npmjs.com/
				## https://github.com/npm


				sudo apt install npm -y

                                ## Installs Configuration Files 
                                cd 

				echo """
========================================================================================
		Welcome to Senal's Config Installer
========================================================================================
=
	1) Arch Linux                           [Status: STABLE]

	2) Debian                               [Status: KINDA STABLE]

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
                ##      Search: Kali-Linux
                ###########################################################

		## After the user chooses Kali-Linux, then it will install the 
		## dependencies for my config in Kali-Linux. 

	
		7)
				## This script installs apps/dependencies for my config and more


				## Making sure the APT repositories/packages are updated
				sudo apt update -y && sudo apt upgrade -y


                                ## Installs i3

                                ## https://i3wm.org/

                                ## https://github.com/i3

                                sudo apt install i3 -y




                                ## Installs openjdk

                                ## https://jdk.java.net/

                                ## https://github.com/openjdk




                                ## Installs Configuration Files 
                                cd Kali-Linux && sh configure.sh

				echo """
========================================================================================
		Welcome to Senal's Config Installer
========================================================================================
=
	1) Arch Linux                           [Status: STABLE]

	2) Debian                               [Status: KINDA STABLE]

	3) Fedora                               [Status: STABLE]

	4) Pop!_OS                              [Status: NOT TESTED]

	5) macOS                                [Status: TESTED/STABLE]

	6) Ubuntu-Multipass                     [STATUS: STABLE]
        
        7) Kali-Linux                           [STATUS: NOT STABLE] [NEW]

	8) Exit
========================================================================================
				"""
			;;

			

		8)
			exit
			;;


		*)
			echo """
			
			"""
esac
done
