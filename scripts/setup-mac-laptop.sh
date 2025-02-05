## setup-mac-laptop

function uninstall() {
    brew uninstall vscodium    
    brew uninstall firefox
    brew uninstall opera-gx
    brew uninstall kitty
    brew uninstall tabby
	brew uninstall microsoft-edge@dev
	brew uninstall ghostty
	brew uninstall gpt4all

}
uninstall

function install() {
    brew install discord
    brew install fish
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
    brew install rust 
    brew install zellij
    brew install alacritty
    brew install rustdesk
    brew install hugo
    brew install vscodium
    brew install emacs
} 
install


function enableServices()
{
	echo "not yet"
}


function disableServices()
{
	echo "not yet"
}



function setup()
{
    cd ../setup-mac-laptop-config && cp -R fish /Users/senal/.config/ && cp -R micro /Users/senal/.config/
}
setup
