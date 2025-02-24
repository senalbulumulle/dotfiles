## setup-mac-laptop

function uninstall() {
	brew uninstall firefox
	brew uninstall opera-gx
	brew uninstall tabby
	brew uninstall microsoft-edge@dev
	brew uninstall ghostty
	brew uninstall gpt4all
	brew uninstall zellij
	brew uninstall blender

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
	brew install alacritty
	brew install kitty
	brew install rustdesk
	brew install hugo
	brew install vscodium
	brew install emacs
	brew install libreoffice
	brew install tree
	brew install mpv
	brew install wacom-tablet
	brew install alt-tab

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



# function setup()
# {
# 	cd ../setup-mac-laptop-config && cp -R fish /Users/senal/.config/ && cp -R micro /Users/senal/.config/
# }
# setup
