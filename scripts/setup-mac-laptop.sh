## setup-mac-laptop

function uninstall() {
    brew uninstall vscodium    
    brew uninstall firefox
    brew uninstall opera-gx
    brew uninstall kitty
    brew uninstall tabby
}
uninstall

function install() {
    brew install discord
    brew install fish
    brew install microsoft-edge@dev
    brew install google-chrome
    brew install gh
    brew install micro
    brew install signal
    brew install watchman
    brew install nvim
    brew install php
    brew install chatgpt
    brew install macs-fan-control
    brew install zen-browser
    brew install code-server
    brew install ghostty
}
install



function setup()
{
    cd ../setup-mac-laptop-config && cp -R fish /Users/senal/.config/ && cp -R micro /Users/senal/.config/
}
setup