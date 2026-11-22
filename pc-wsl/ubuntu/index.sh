## SETUP SCRIPT

sudo apt update -y
sudo apt upgrade -y
sudo apt install git -y
sudo apt install fish -y
sudo apt install micro -y

## optional
# sudo apt install firefox -y


## Setting up the git configurations
## ! Uncomment the the lines to configure git credentials.

#git config --global user.name ""
#git config --global user.email ""



## Setting up claude code (user)
curl -fsSL https://claude.ai/install.sh | bash


## Setting up Codex CLI (user)
curl -fsSL https://chatgpt.com/codex/install.sh | sh


