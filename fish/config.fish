if status is-interactive
        ## Set default editor

        ## For example if you want vim, replace "micro" with vim
        ## For example if you want nvim, replace "micro" with nvim
        
        export EDITOR="micro"   
        export VISUAL="micro"

        
        ## If the user types in 'detect-model', it will prompt the user 
        ## the superuser password, before showing the model name, and
        ## the firmware version of the hardware. 
        
        function detect-model
                sh /home/$USER/.config/senal-scripts/detect-model.sh
        end 

	
	function config-fish 
		micro /home/$USER/.config/fish/config.fish
	end	


	## Fedora Silverblue or Kinoite

	## REQUIREMENTS: 
	##
	#
	#	- distrobox
	#	- rpm-ostree upgrade
	#	- rpm-ostree install distrobox
	#	- systemctl reboot
	#

	## CONTAINER NEW CLONE
	function cnc
		bash /home/$USER/.config/fish/container-clone.sh
	end

	## CONTAINER CLONE EDIT
	function cce
		micro /home/$USER/.config/fish/container-clone-edit.sh
	end

	## CONTAINER IMAGE REFERENCE
	function ccr
		clear
		cat /home/$USER/clone-image-reference
	end

	## LIST CONTAINERS
	function cl
		clear
		distrobox list
	end 


	function edit
	        emacs --no-window-system
	end
end
