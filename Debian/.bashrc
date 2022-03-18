########################################################
#	Senal's .bashrc Config
#
########################################################


## Make the Micro Editor Default to use it on Ranger File Manager
VISUAL=micro; export VISUAL EDITOR=micro; export micro



########################################################
#	Aliases 
#			
########################################################




## Updates packages
alias update-packages="sudo apt update && sudo apt upgrade"





########################################################
#	Functions to make the workflow easier. 
#			
########################################################


########################################################
#	Turns on or off Hidden Files in Apple macOS
#	Finder
########################################################
function mac.hidden.files.on() {
	defaults write com.apple.finder AppleShowAllFiles YES;
	killall Finder
	echo "/!\ The Hidden Files is turned on. "
}

function mac.hidden.files.off() {
	defaults write com.apple.Finder AppleShowAllFiles NO; 
	killall Finder
	echo "/!\ The Hidden Files is turned off. "
}





########################################################
#	Turns on or off Single App Mode in Apple macOS
########################################################
function mac.single.app.mode.on() {
	defaults write com.apple.dock single-app -bool true;killall Dock
}


function mac.single.app.mode.off() {
	defaults write com.apple.dock single-app -bool no;killall Dock
}


##################################################################
#   	This Section converts from any document files 
#       to html
#       Credits to Libreoffice and soffice cli
##################################################################

senal.convert.lecture.notes.pptx() {
	soffice --headless --convert-to html *.pptx
}



senal.convert.lecture.notes.docx() {
	soffice --headless --convert-to html *.docx
}


senal.convert.lecture.notes.pdf() {
	soffice --headless --convert-to html *.pdf
}



########################################################
#	Generates boilerplates for project files 
########################################################

## Generates HTML Template. 

function boilerplate.generate.html(){
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
}




function boilerplate.generate.c() {
	touch name.c
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
	
}


function boilerplate.generate.python() {
		touch main.py		
		echo """
###############################################################
#	Title: 
#        
#	Author: 
#
# 	Description: 
###############################################################/
def main():
	## Program Here 
    
# Call the Main Function 
main()		
	
	
	
	""" > main.py
}

function boilerplate.generate.java() {
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

}




function boilerplate.generate.README.md {
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
}

