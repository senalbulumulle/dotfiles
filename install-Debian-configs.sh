## After the user chooses Debian, then it will install the
## dependencies for my config in Debian, if not, it will
## restart the script to go back to the main menu.


## Making sure the APT repositories/packages are updated
sudo apt update -y  && sudo apt upgrade -y



## Installs i3

## https://i3wm.org/

## https://github.com/i3

sudo apt install i3 -y



## Installs fish
sudo apt install fish -y


## Installs zsh
sudo apt install zsh -y



## Installs notes

## https://github.com/pimterry/notes

curl -Ls https://raw.githubusercontent.com/pimterry/notes/latest-release/install.sh | sudo bash



## Installs Oh My Fish

## https://github.com/oh-my-fish/oh-my-fish

curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
