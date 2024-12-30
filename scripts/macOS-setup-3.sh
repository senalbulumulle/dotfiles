## Create the mkdir -p ~/.local/bin directory
mkdir -p ~/.local/bin



cd /Users/$USER/.local/bin && touch update-apps.sh			## Allows the ability to install, and delete dependencies
															## dynamically



cd /Users/$USER/.local/bin && touch update-brew.sh			## Allows the ability to update and upgrade brew packages




rm -rf /Users/$USER/.local/bin/update-apps.sh

echo """
brew update && brew upgrade
brew install discord
brew install fish
brew install microsoft-edge@dev
brew install google-chrome
brew install firefox
brew uninstall vscodium
brew install gh
brew install kitty
brew install micro
brew install signal
brew install watchman
brew install nvim
brew install php
brew install tabby
brew install chatgpt
brew uninstall firefox
brew install opera-gx
brew install macs-fan-control
brew install zen-browser
brew install code-server
""" >> /Users/$USER/.local/bin/update-apps.sh
