## setup-mac-laptop

## These scripts are designed specifically for my dad, with some more additions

function uninstall() {
	brew uninstall vscodium    
	brew uninstall opera-gx
	brew uninstall kitty
	brew uninstall tabby
	brew uninstall microsoft-edge@dev
	brew uninstall ghostty
	brew uninstall gpt4all
	brew uninstall zellij

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
        brew install firefox
        brew install zen-browser
        brew install code-server
        brew install rust
        brew install rustdesk
        brew install alacritty
        brew install vscodium
        brew install emacs
        brew install kindle
        brew install ollama
        brew install exo
        brew install --cask adobe-acrobat-reader
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


function misc()
{
	softwareupdate --install-rosetta --agree-to-license
}
misc


# function setup()
# {
#     cd ../setup-mac-laptop-config && cp -R fish /Users/senal/.config/ && cp -R micro /Users/senal/.config/
# }
# setup
