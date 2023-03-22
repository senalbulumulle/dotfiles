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
        
end
