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

	1) Arch Linux

	2) Debian

	3) Fedora

	4) Pop!_OS

	5) macOS

	6) Ubuntu-Multipass

	7) Exit
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


				## Installs Librewolf 

				## https://librewolf.net/ 
				## https://gitlab.com/librewolf-community

				sudo pacman -S --noconfirm librewolf


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


				## Installs nwgbar

				## https://github.com/nwg-plor/nwg-bar

				sudo pacman -S --noconfirm nwgbar


                                ## Installs Configuration Files 
                                cd Arch-Linux 
                                sh configure.sh

				echo """
				========================================================================================
						Welcome to Senal's Config Installer
				========================================================================================

					1) Arch Linux

					2) Debian

					3) Fedora

					4) Pop!_OS

					5) macOS

					6) Ubuntu-Multipass

					7) Exit
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
				sudo apt update && sudo apt upgrade 


				## Installs Librewolf 

				## https://librewolf.net/
				## https://gitlab.com/librewolf-community
				## https://librewolf.net/installation/debian/
				## 

				echo "deb [arch=amd64] http://deb.librewolf.net $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/librewolf.list
				sudo wget https://deb.librewolf.net/keyring.gpg -O /etc/apt/trusted.gpg.d/librewolf.gpg
				sudo apt install librewolf

				## Installs Kitty

				## https://sw.kovidgoyal.net/kitty/
				## https://github.com/kovidgoyal/kitty	

				sudo apt install kitty 


				## Installs Neofetch 

				## https://github.com/dylanaraps/neofetch

				sudo apt install neofetch



				## Installs Ranger 

				## https://github.com/ranger/ranger
				## https://ranger.github.io/

				sudo apt install ranger 


				## Installs fish 

				## https://fishshell.com/
				## https://github.com/fish-shell/fish-shell


				sudo apt install fish




				## Installs Micro Editor 

				## https://micro-editor.github.io/
				## https://github.com/zyedidia/micro

				sudo apt install micro




				## Installs neovim

				## https://neovim.io/
				## https://github.com/neovim

				sudo apt install neovim




				## Installs vim

				## https://www.vim.org/
				## https://github.com/vim

				sudo apt install vim




				## Installs rofi

				## https://github.com/davatorium/rofi

				sudo apt install rofi



				## Installs tint2

				## https://gitlab.com/o9000/tint2
				## https://github.com/o9000/tint2


				sudo apt install tint2



				## Installs i3 (installs i3-gaps manually)

				## https://github.com/i3/i3
				## https://github.com/Airblader/i3
				## https://i3wm.org/




				## Installs autoconf 
				sudo apt install autoconf 

				## Installs build-essential
				sudo apt install build-essential

				## Installs git 
				sudo apt install stow 

				## Installs stow
				sudo apt install stow

				## Installs tmux 
				sudo apt install tmux

				## Installs tree
				sudo apt install tree

				## Adds the Debian backports 
				echo "deb http://ftp.debian.org/debian stretch-backports main" > /etc/apt/sources.list.d/backports.list
				apt update


				## Installs libev-dev
				sudo apt install libev-dev

				## Installs libpango1.0-dev
				sudo apt install libpango1.0-dev

				## Installs libstartup-notification0-dev
				sudo apt install libstartup-notification0-dev

				## Installs libxcb-cursor-dev
				sudo apt install libxcb-cursor-dev

				## Installs libxcb-icccm4-dev
				sudo apt install libxcb-icccm4-dev

				## Installs libxcb-keysyms1-dev
				sudo apt install libxcb-keysyms1-dev

				## Installs libxcb-randr0-dev
				sudo apt install libxcb-randr0-dev

				## Installs libxcb-util0-dev
				sudo apt install libxcb-util0-dev

				## Installs libxcb-xinerama0-dev
				sudo apt install libxcb-xinerama0-dev

				## Installs libxcb-xkb-dev
				sudo apt install libxcb-xkb-dev

				## Installs libxcb-xrm-dev
				sudo apt install libxcb-xrm-dev

				## Installs libxcb-xrm0
				sudo apt install libxcb-xrm0

				## Installs libxcb1-dev
				sudo apt install libxcb1-dev

				## Installs libxkbcommon-dev
				sudo apt install libxkbcommon-dev

				## Installs libxkbcommon-x11-dev
				sudo apt install libxkbcommon-x11-dev

				## Installs libyajl-dev
				sudo apt install libyajl-dev

				## Installs xcb
				sudo apt install xcb


				## Change the directory to /usr/local/src/
				cd /usr/local/src

				## Clone the i3-gaps repository
				git clone https://github.com/Airblader/i3 i3-gaps
				cd i3-gaps


				## Build the source 
				hash=$(git rev-parse --short HEAD)
				autoreconf --force --install
				mkdir build && cd "$_"
				../configure --prefix=/usr/local --sysconfdir=/etc --disable-sanitizers
				make PREFIX=/usr/local
				make install prefix=/usr/local/stow/i3-gaps-$(hash)


				## Set some permissions in order to work 
				find /usr/local/stow/i3-gaps-$(hash) -type d -exec chmod 755 {} \;
				find /usr/local/stow/i3-gaps-$(hash) -type f -exec chmod 644 {} \;
				chmod -R 755 /usr/local/stow/i3-gaps-$(hash)/bin


				## Install sym links 
				cd /usr/local/stow
				stow i3-gaps-$(hash)


				## Installs feh
				sudo apt install feh

				## Installs i3blocks
				sudo apt install i3blocks

				## Installs i3lock
				sudo apt install i3lock

				## Installs suckless-tools
				sudo apt install suckless-tools

				## Installs xorg 
				sudo apt install xorg 






				## Installs OpenBox

				## https://github.com/danakj/openbox


				sudo apt install openbox



				## Installs Nitrogen

				## https://nitrogenproject.com/

				## https://github.com/nitrogen/nitrogen


				sudo apt install nitrogen



				## Installs picom 

				## https://github.com/yshui/picom

				sudo apt install picom



				## Installs Polybar

				## https://github.com/polybar/polybar
				## https://polybar.github.io/

				sudo apt install polybar


				## Installs xfce4

				## https://xfce.org/

				## https://gitlab.xfce.org/explore/groups?sort=name_desc

				sudo apt install xfce4

                                ## Installs Configuration Files 
                                cd debian
                                sh configure.sh

				echo """
				========================================================================================
						Welcome to Senal's Config Installer
				========================================================================================

					1) Arch Linux

					2) Debian

					3) Fedora

					4) Pop!_OS

					5) macOS

					6) Ubuntu-Multipass

					7) Exit
				========================================================================================
				"""
			;;

                ###########################################################
                ##      Search: Fedora
                ###########################################################

			
		## After the user chooses Fedora, then it will install the 
		## dependencies for my config in Fedora.

		
		3)
				## This script installs apps/dependencies for my config and more


				## Making sure the DNF repositories/packages are updated
				sudo dnf update && sudo dnf upgrade 


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



                                ## Enables the free repository

                                ## https://docs.fedoraproject.org/en-US/quick-docs/setup_rpmfusion/


                                sudo dnf -y install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm


                                ## Installs Configuration Files 
                                cd Fedora && sh configure.sh

				echo """
				========================================================================================
						Welcome to Senal's Config Installer
				========================================================================================

					1) Arch Linux

					2) Debian

					3) Fedora

					4) Pop!_OS

					5) macOS

					6) Ubuntu-Multipass

					7) Exit
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
				sudo apt update && sudo apt upgrade 


				## Removes the Firefox Browser 
				sudo apt autopurge firefox*



				## Installs Librewolf 

				## https://librewolf.net/
				## https://gitlab.com/librewolf-community
				## https://librewolf.net/installation/debian/

				echo "deb [arch=amd64] http://deb.librewolf.net $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/librewolf.list
				sudo wget https://deb.librewolf.net/keyring.gpg -O /etc/apt/trusted.gpg.d/librewolf.gpg
				sudo apt install librewolf




				## Installs Kitty

				## https://sw.kovidgoyal.net/kitty/
				## https://github.com/kovidgoyal/kitty	

				sudo apt install kitty


				## Installs Neofetch 

				## https://github.com/dylanaraps/neofetch

				sudo apt install neofetch



				## Installs Ranger 

				## https://github.com/ranger/ranger
				## https://ranger.github.io/

				sudo apt install ranger 


				## Installs fish 

				## https://fishshell.com/
				## https://github.com/fish-shell/fish-shell


				sudo apt install fish




				## Installs Micro Editor 

				## https://micro-editor.github.io/
				## https://github.com/zyedidia/micro

				sudo apt install micro




				## Installs neovim

				## https://neovim.io/
				## https://github.com/neovim

				sudo apt install neovim




				## Installs vim

				## https://www.vim.org/
				## https://github.com/vim

				sudo apt install vim




				## Installs rofi

				## https://github.com/davatorium/rofi

				sudo apt install rofi



				## Installs tint2

				## https://gitlab.com/o9000/tint2
				## https://github.com/o9000/tint2


				sudo apt install tint2





				## Installs i3

				## https://github.com/i3/i3
				## https://github.com/Airblader/i3
				## https://i3wm.org/


				sudo apt install i3*




				## Installs OpenBox

				## https://github.com/danakj/openbox


				sudo apt install openbox



				## Installs Nitrogen

				## https://nitrogenproject.com/

				## https://github.com/nitrogen/nitrogen


				sudo apt install nitrogen



				## Installs picom

				## https://github.com/yshui/picom

				sudo apt install picom




				## Installs Polybar

				## https://github.com/polybar/polybar
				## https://polybar.github.io/

				sudo apt install polybar


				## Installs xfce4

				## https://xfce.org/

				## https://gitlab.xfce.org/explore/groups?sort=name_desc

				sudo apt install xfce4

                                ## Installs Configuration Files 
                                cd Pop!_OS && sh configure.sh

				echo """
				========================================================================================
						Welcome to Senal's Config Installer
				========================================================================================

					1) Arch Linux

					2) Debian

					3) Fedora

					4) Pop!_OS

					5) macOS

					6) Ubuntu-Multipass

					7) Exit
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

                                ## Installs Configuration Files 
                                cd macOS && sh configure.sh



				echo """
				========================================================================================
						Welcome to Senal's Config Installer
				========================================================================================

					1) Arch Linux

					2) Debian

					3) Fedora

					4) Pop!_OS

					5) macOS

					6) Ubuntu-Multipass

					7) Exit
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
				sudo apt update && sudo apt upgrade 




				## Installs Kitty

				## https://sw.kovidgoyal.net/kitty/
				## https://github.com/kovidgoyal/kitty	

				sudo apt install kitty 


				## Installs Neofetch 

				## https://github.com/dylanaraps/neofetch

				sudo apt install neofetch



				## Installs Ranger 

				## https://github.com/ranger/ranger
				## https://ranger.github.io/

				sudo apt install ranger 


				## Installs fish 

				## https://fishshell.com/
				## https://github.com/fish-shell/fish-shell


				sudo apt install fish




				## Installs Micro Editor 

				## https://micro-editor.github.io/
				## https://github.com/zyedidia/micro

				sudo apt install micro




				## Installs neovim

				## https://neovim.io/
				## https://github.com/neovim

				sudo apt install neovim




				## Installs vim

				## https://www.vim.org/
				## https://github.com/vim

				sudo apt install vim




				## Installs build-essential
				sudo apt install build-essential



				## Installs openjdk

				## https://openjdk.java.net/
				## https://github.com/openjdk
				sudo apt install openjdk


				## Installs php 

				## https://www.php.net/
				## https://github.com/php


				sudo apt install php 



				## Installs nodejs

				## https://nodejs.org/en/
				## https://github.com/nodejs 


				sudo apt install nodejs



				## Installs npm 

				## https://www.npmjs.com/
				## https://github.com/npm


				sudo apt install npm

                                ## Installs Configuration Files 
                                cd 

				echo """
				========================================================================================
						Welcome to Senal's Config Installer
				========================================================================================

					1) Arch Linux

					2) Debian

					3) Fedora

					4) Pop!_OS

					5) macOS

					6) Ubuntu-Multipass

					7) Exit
				========================================================================================
				"""
			;;
			

		7)
			exit
			;;


		*)
			echo """
			
			"""
esac
done
