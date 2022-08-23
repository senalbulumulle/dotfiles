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
