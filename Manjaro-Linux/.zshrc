############################################################
#		.zshrc config
#
###########################################################
###########################################################
#	Begin Manjaro .zshrc config 
###########################################################
# Use powerline
USE_POWERLINE="true"
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi
###########################################################
#	End  Manjaro .zshrc config 
###########################################################

## Make the Micro Editor Default to use it on Ranger File Manager
VISUAL=micro; export VISUAL EDITOR=micro; export micro




    # _      _   _
    # / \    | | (_)   __ _   ___    ___   ___
   # / _ \   | | | |  / _` | / __|  / _ \ / __|
  # / ___ \  | | | | | (_| | \__ \ |  __/ \__ \
 # /_/   \_\ |_| |_|  \__,_| |___/  \___| |___/


alias update-packages='sudo pacman -Syyu'
alias emacs='emacsclient'
