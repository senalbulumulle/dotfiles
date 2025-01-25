## install.sh

## Allows the ability to output for testing purposes
echo "it works"


## This is where we are able to use brew.sh to install
## brew in general for macOS

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"



## Go to the Home Directory
cd /Users/$USER/



## Create the .zprofile directory
touch .zprofile

## Then create this script to make homebrew work properly
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> .zprofile



