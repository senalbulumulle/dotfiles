## setup.sh

## This is where we make a function called uninstall() which uninstalls the packages via Brew
function uninstall() {
  brew uninstall karabiner-elements
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
  brew uninstall anaconda-navigator
  brew uninstall godot
  brew uninstall streamlabs
  brew uninstall obs
}
uninstall

## This is where we make a function called installCask which installs the cask packages via Brew
function installCask() {
  brew install --cask cursor
  brew install --cask emacs
  brew install --cask neovide
  brew install --cask ollama
  brew install --cask ranger
  brew install --cask webull
  brew install --cask microsoft-teams
  brew install --cask utm
  brew install --cask parallels
  brew install --cask obsidian
  brew install --cask inkscape
  brew install --cask discord
  brew install --cask google-chrome
  brew install --cask macs-fan-control

}
installCask

## This is where we make a function called install which installs the packages via Brew
function install() {
  brew install qemu
  brew install fish
  brew install gh
  brew install micro
  brew install signal
  brew install watchman
  brew install nvim
  brew install php
  brew install chatgpt
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
  brew install solidity
}
install
