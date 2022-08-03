if status is-interactive
        # Commands to run in interactive sessions can go here

        ########################################################
        #	  Senal's config.fish Config
        #
        ########################################################
        
        
        ########################################################
        #	  A L I A S E S 
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
        #	  F U N C T I O N S 
        #	TO MAKE WORKFLOW EASIER
        ########################################################
        
        
        
        
        ########################################################
        #	  Description Here
        ########################################################
        function <FUNCTION-NAME>
                        
        end 


    ########################################################
    #	  Boilerplates
    #		
    ########################################################
        function boilerplate.generate.c 
    	        touch main.c
		echo """
/*************************************************************
*	Title: 
*        
* 	Author: 
*
* 	Description: 
**************************************************************/
		
		

#include <stdio.h>

int main() {
   // Program here
   return 0;
}		


	        """ > main.c
        end 