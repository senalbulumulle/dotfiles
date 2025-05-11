## setup.sh


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
	brew install visual-studio-code
	brew install rust
	brew install alacritty
	brew install kitty
	brew install rustdesk
	brew install visual-studio-code
	brew install --cask cursor
	brew install hugo
	brew install ranger
	brew install --cask emacs
	brew install --cask neovide
	brew install libreoffice
	brew install tree
	brew install mpv
	brew install alt-tab
	brew install utm
	brew install loop
	brew install --cask ollama
	brew install --cask ranger
	brew install arduino-ide
	brew install arduino-cli
	brew install npm
	brew install wget
	brew install flutter
	brew install sdl2 sdl2_ttf
	brew install deno
	brew install docker
	brew install colima
}
install
