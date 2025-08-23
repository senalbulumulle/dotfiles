## setup.sh

## This is where we make a function called uninstall() which uninstalls the packages via Brew
function uninstall() {
	brew uninstall --cask karabiner-elements
	brew uninstall firefox
	brew uninstall opera-gx
	brew uninstall tabby
	brew uninstall microsoft-edge@dev
	brew uninstall ghostty
	brew uninstall gpt4all
	brew uninstall zellij
	brew uninstall blender
	brew uninstall aerospace
	brew uninstall wacom-tablet
	brew uninstall emacs
	brew uninstall ollama
	brew uninstall vscodium
	brew uninstall vscodium@insiders
	brew uninstall loop
	brew uninstall visual-studio-code
	brew uninstall code-server
  	brew uninstall hugo
  	brew uninstall deno
	brew uninstall flutter
	brew uninstall alt-tab
	brew uninstall sdl2 sdl2_ttf
	brew uninstall mactex
}
uninstall

## This is where we make a function called installCask which installs the cask packages via Brew
function installCask() {
	brew install --cask cursor
	brew install --cask emacs
	brew install --cask neovide
	brew install --cask ollama
	brew install --cask ranger
	brew install --cask godot
	brew install --cask streamlabs
        brew install --cask obs
        brew install --cask webull
        brew install --cask microsoft-teams
}
installCask


## This is where we make a function called install which installs the packages via Brew
function install() {
	brew install qemu
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
	brew install rust
	brew install alacritty
	brew install kitty
	brew install rustdesk
	brew install ranger
	brew install libreoffice
	brew install tree
	brew install mpv
	brew install utm
	brew install arduino-ide
	brew install arduino-cli
	brew install npm
	brew install wget
	brew install docker
	brew install colima
	brew install azure-cli
	brew install fswatch
	brew install pybind11
}
install
