if status is-interactive
        ## Set default editor

        ## For example if you want vim, replace "micro" with vim
        ## For example if you want nvim, replace "micro" with nvim
        
        export EDITOR="micro"   
        export VISUAL="micro"


        ## Aliases 

        alias emacsnw='emacs --no-window-system'



        ## If the user types in 'detect-model', it will prompt the user 
        ## the superuser password, before showing the model name, and
        ## the firmware version of the hardware. 
        
        function detectmodel 
                sh /home/$USER/.config/senal-scripts/detect-model.sh
        end



        ## This will go to a preferred editor, "Micro" and go 
        ## straight to /home/$USER/.config/fish/config.fish
	function config-fish 
	        micro /home/$USER/.config/fish/config.fish
	end

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
end
