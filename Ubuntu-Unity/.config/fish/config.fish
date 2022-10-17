if status is-interactive
        # Commands to run in interactive sessions can go here

        ########################################################
        #	  Senal's config.fish Config
        #
        ########################################################
        
        ## For users who are using starship
        starship init fish | source

        ## For users who are using laravel
        export PATH="$PATH:$HOME/.config/composer/vendor/bin"
        
        ########################################################
        #	  A L I A S E S 
        #			
        ########################################################


        ########################################################
        #	  Aliases for Docker
        ########################################################
        function dockerlist
                docker container ls
        end     

        function dockerreference 
                echo """
################
DOCKER REFERENCE 
#################
------------------------------------------------------------
docker run -it -d --name <CONTAINER NAME> <DISTRO>  <SHELL>
docker exec -it <CONTAINER NAME>  /bin/bash
------------------------------------------------------------
                
                """
        end





        ########################################################
        #	  Aliases for Launching emacs
        ########################################################
        function emacs-alone
                 setsid emacs
        end

        function emacs-terminal
                 emacs --no-window-system
        end


        ########################################################
        #	  Updates Packages
        ########################################################            
        
        function update-packages
                        sudo apt update -y && sudo apt upgrade -y
        end      





        
        ########################################################
        #	  F U N C T I O N S 
        #	TO MAKE WORKFLOW EASIER
        ########################################################

end
