## config-install-new.sh

## New Shell Script that uses if statements to find a linux distro
## and then automatically download dependencies and my configs. 

## Written by Senal Bulumulle



if lsb_release -a| grep Pop!_OS
then 
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

	fi
fi

if lsb_release -a| grep Arch Linux
then
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

fi


if lsb_release -a| grep Kali Linux
then 
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




	## Installs Kitty

	## https://sw.kovidgoyal.net/kitty/
	## https://github.com/kovidgoyal/kitty	

	sudo apt install kitty -y
