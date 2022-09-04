########################################################
#	  Revert Git Commits
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


function boilerplate.generate.java
        touch main.java
        echo """
/**************************************************************
*	Title: 
*	
*	Author:
*
*	Description:
*
***************************************************************/
public class Main {
	
	public static void main(String[] args) {

		// Program Here
	}
}				
        """ > main.java

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