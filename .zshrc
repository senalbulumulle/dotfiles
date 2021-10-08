########################################################
#	Senal's .zshrc Config
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
#		Turns on or off Single App Mode in Apple macOS
########################################################
function mac.single.app.mode.on() {
	defaults write com.apple.dock single-app -bool true;killall Dock
}


function mac.single.app.mode.off() {
	defaults write com.apple.dock single-app -bool no;killall Dock
}






########################################################
#		Generates boilerplates for project files 
########################################################

function boilerplate() {
    clear 
	echo "	Welcome to the help screen of Boilerplates \n"
	echo "	This is where you can generate many templates of programming languages and more.\n"
	echo "* boilerplate.generate.html(): Generates an HTML file. \n"
	echo "* boilerplate.generate.html(): Generates an HTML file.\n"
	echo "* boilerplate.generate.html(): Generates an HTML file.\n"
	echo "* boilerplate.generate.html(): Generates an HTML file.\n"
	echo "* boilerplate.generate.html(): Generates an HTML file.\n"
	echo "* boilerplate.generate.html(): Generates an HTML file.\n"
	echo "* boilerplate.generate.html(): Generates an HTML file.\n"
	echo "* boilerplate.generate.html(): Generates an HTML file.\n"
	echo "* boilerplate.generate.html(): Generates an HTML file.\n"
	echo "* boilerplate.generate.html(): Generates an HTML file.\n"
}

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


	""" > name.html
}

## Generates the full HTML Template. 
function boilerplate.generate.html.full(){
	echo "hello world"
}




## Generates the CSS File
function boilerplate.generate.css() {
	echo "hello world"
}





function boilerplate.generate.c() {
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
	
}




function boilerplate.generate.js() {
	echo "hello world"
}
