##              SENAL'S FISH CONFIG                     #
##                                                      #
##                                                      #
##########################################################



if status is-interactive
        ## SET THE DEFAULT EDITOR

        ## For example if you want vim, replace "micro" with vim
        ## For example if you want nvim, replace "micro" with nvim
        
        export EDITOR="micro"   
        export VISUAL="micro"


        ## ALIASES
        alias emacss='emacs --no-window-system'                                         ## Launches Senal's Emacs in the terminal instead of the window
	alias ce='distrobox enter'                                                      ## This will enter to a distrobox container
	alias cs='distrobox stop'                                                       ## This will stop a distrobox container
        alias cm='distrobox rm'                                                         ## This will remove a distrobox container
        alias cl='clear && distrobox rm'                                                ## This will remove a distrobox container
	alias bashedit='micro /home/$USER/.bashrc'                                      ## Goes directly to [/home/$USER/.bashrc]                                         
        alias about='clear && cat /home/$USER/.config/fish/about'                       ## Shows the about screen about Senal's Config
        alias manual='less /home/$USER/dotfiles/README.org'                             ## Shows the manual how to do things with Senal's config in general	
        alias kittyconfig='micro /home/$USER/.config/kitty/kitty.conf'                  ## Goes directory to [/home/$USER/.config/kitty/kitty.conf]

        
        ## If the user types in 'detect-model', it will prompt the user         
        ## the superuser password, before showing the model name, and
        ## the firmware version of the hardware. 
        
        function detectmodel 
                sh /home/$USER/.config/senal-scripts/detect-model.sh
        end



        
        ## THIS WILL GO TO A PREFERRED EDITOR, "micro", AND GO
        ## STRAIGHT TO /home/$USER/.config/fish/config.fish
	function config-fish 
	        micro /home/$USER/.config/fish/config.fish
	end
end
