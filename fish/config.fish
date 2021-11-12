if status is-interactive
    # Commands to run in interactive sessions can go here

    ########################################################
    #				Senal's config.fish Config
    #
    ########################################################
    
    
    
    
    
    
    ########################################################
    #		Functions to make the workflow easier. 
    #			
    ########################################################
    
    
    
    
    ########################################################
    #		Turns on or off Hidden Files in Apple macOS
    #		Finder
    ########################################################
    function mac.hidden.files.on
    	defaults write com.apple.finder AppleShowAllFiles YES;
    	killall Finder
    	echo "/!\ The Hidden Files is turned on. "
    end 

    
    function mac.hidden.files.off
    	defaults write com.apple.Finder AppleShowAllFiles NO; 
    	killall Finder
    	echo "/!\ The Hidden Files is turned off. "
    end







    ########################################################
    #    Boilerplates
    #		
    ########################################################
    function boilerplate.generate.c 
    	touch main.c
		echo """
/*************************************************************
*		Title: 
*        
* 		Author: 
*
* 		Description: 
**************************************************************/
		
		

#include <stdio.h>

int main() {
   // Program here
   return 0;
}		


	""" > main.c
	
    	
    	
    end 









    
    function boilerplate.generate.python
        touch main.py		
		echo """
###############################################################
#		Title: 
#        
#		Author: 
#
# 		Description: 
###############################################################/
def main():
	## Program Here 
    
# Call the Main Function 
main()		
		




	""" > main.py
    	
    	
    end



    function boilerplate.generate.html
    touch main.html
	echo """
	<html>
	  <head>
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title>Your Web Application</title>
	    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/senalbulumulle/FOIL-UI-Framework-Library/FOIL-UI.css">
	  </head>
	  <body>
		<!-- Content here --> 
	  </body>
	</html>


	""" > main.html    	
    	
    	
    end





    function boilerplate.generate.readme.md
    touch README.md
	echo """
# Title



#### Introduction


#### Requirements

- [ ] A
- [ ] B
- [ ] C
- [ ] D



#### Installation


	""" > README.md 


	end
    


    ########################################################
    #		Turns on or off Hidden Files in Apple macOS
    #		Finder
    ########################################################
    function senal.convert.lecture.notes.pptx
    	soffice --headless --convert-to html *.pptx
    end 

    function senal.convert.lecture.notes.docx
    	soffice --headless --convert-to html *.docx
    end 

    function senal.convert.lecture.notes.pdf
    	soffice --headless --convert-to html *.pdf
    end 



    
    
end
