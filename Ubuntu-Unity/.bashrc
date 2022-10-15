########################################################
#	Senal's .bashrc Config
#
#
#	Designed for Ubuntu-Unity Linux 
########################################################


export PS1="\n\n\n\n\n\[$(tput sgr0)\]\[\033[38;5;6m\][\w]\[$(tput sgr0)\]: \[$(tput sgr0)\]"

## Make the Micro Editor Default to use it on Ranger File Manager
## If you vim, uncomment it. 

VISUAL=micro; export VISUAL EDITOR=micro; export micro

## VISUAL=vim; export VISUAL EDITOR=vim; export vim



########################################################
#	Aliases 
#			
########################################################

## Lists files using ls -l
alias ls='ls -l'

## Updates packages
alias update-packages='sudo apt update -y  && sudo apt upgrade -y'


## Revert Git Commits 
alias undo-change='git reset --hard HEAD~1'
alias confirm-undo-change='git push origin -f'



## Git Shortcuts 
alias push='git push origin'
alias pull='git pull'
alias clone='git clone'
alias message='git commit -m'


## System Information
alias battery-info='echo -e "Battery Information\n\n" && cat /sys/class/power_supply/BAT0/capacity'



## Docker stuff 
alias dockerlist='docker container ls'


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
/**************************************************************
*	Title:
*	
*	Author: 
*
*	Description:
***************************************************************/
		
		

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
################################################################
#	Title
#
#	Author
#
#	Description:
#################################################################
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

public static void main(String[])
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

export PATH="$HOME/.composer/vendor/bin:$PATH"
