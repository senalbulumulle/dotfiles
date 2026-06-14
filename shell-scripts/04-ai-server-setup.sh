#
# This script allows the ability to setup the entire local llm server stack
#
#

# @docs
#
## This is where we are able to update the packages.

## this will also detect the other distros that would be used
## update the packages with this script as well.

function updatePackages()
{
    sudo pacman -Syyu --noconfirm && \
    paru -Syyu --noconfirm
}

updatePackages


function ai_tools_install()
{
        yay -S ollama-bin --noconfirm

}

ai_tools_install
