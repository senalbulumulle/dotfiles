if status is-interactive
        # Commands to run in interactive sessions can go here

        ########################################################
        #	  Senal's config.fish Config
        #
        ########################################################
        
        
        ########################################################
        #	  Aliases 
        #			
        ########################################################

        ########################################################
        #	  Updates Packages
        ########################################################            
        
        function update-packages
                        sudo pacman -Syyu
        end
        ########################################################
        #	  Revert Git Commits
        ########################################################  
        function undo-change
                        git reset --hard HEAD~1
        end

        function confirm-undo-change
                        git push origin -f 
        end
        ########################################################
        #	  Git Shortcuts
        ########################################################  
        function push
                        git push origin
        end

        function pull
                        git pull
        end

        function clone
                        git clone
        end

        function message
                        git commit -m 
        end        





        
        ########################################################
        #	  Functions to make the workflow easier. 
        #			
        ########################################################
        
        
        
        
        ########################################################
        #	  Description Here
        ########################################################
        function <FUNCTION-NAME>
                        here
        end 