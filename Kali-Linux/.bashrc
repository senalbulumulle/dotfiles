########################################################
#	Senal's .bashrc Config
#
#
#
#	Specfically for Kali Linux
########################################################

########################################################
#	
#	/!\ THIS SHALL BE USED FOR EDUCATIONAL/RESEARCH
#	    PURPOSES
#
#########################################################


## Make the Micro Editor Default to use it on Ranger File Manager
VISUAL=micro; export VISUAL EDITOR=micro; export micro



########################################################
#	Aliases 
#			
########################################################




## Updates packages
alias update-packages='sudo apt update && sudo apt upgrade'


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



########################################################
#	Functions to make the workflow easier. 
#			
#######################################################

## Later on...
