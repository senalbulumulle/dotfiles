# Senal's Configuration Files


Senal's own dotfiles manager

## Introduction
Senal's wonderful dotfiles manager allows the ability to get inspired and 
get creative and be innovative with talent. 

With Senal's dotfiles manager, you realize the organization of setups that
Senal has will definitely makes you want to do something.


## Installing dots on the fly

In order to install dots on the fly, you need to use this link and paste it on the terminal
in order to make it work

``` shell
curl -s https://raw.githubusercontent.com/senalbulumulle/dotfiles/refs/heads/main/install.sh | bash
```

### Install Senal's setup files for mac laptop

`curl -s https://raw.githubusercontent.com/senalbulumulle/dotfiles/refs/heads/main/scripts/setup-mac-laptop.sh | bash`

### Install Senal's Dad's setup files for mac laptop

```
curl -s https://raw.githubusercontent.com/senalbulumulle/dotfiles/refs/heads/main/scripts/setup-mac-laptop-dad.sh | bash`
```


### ThinkPad-T480 Setup

#### Minimal Setup
```
curl -s https://raw.githubusercontent.com/senalbulumulle/dotfiles/refs/heads/main/scripts/ThinkPad-T480/01.sh | bash`
```

## Sync Dots on the Mac (This section might be removed soon)

In this section, we are going to be talking about how to sync dots on the Mac. 

Syncing dots on the mac, the way that I made, makes it efficient to sync
my dotfiles on every Mac Device. Very Efficient Indeed....

1. `cd scripts/`
2. `sh setup-mac-laptop.sh`



## Any Suggestions to my dotfiles?



## TODO

    - Symlink the files to dotfiles to .config and others [SOMEWHAT COMPLETED]


## Symlinking

```
ln -s /Users/$USER/dotfiles/.vimrc /Users/$USER/.vimrc
ln -s /Users/$USER/dotfiles/.zshrc /Users/$USER/.zshrc
ln -f /Users/$USER/dotfiles/.emacs /Users/$USER/.emacs
ln -s /Users/$USER/dotfiles/fish /Users/$USER/.config/fish
```


## Symlinking

```
ln -s /Users/$USER/dotfiles/nvim /Users/$USER/.config/nvim
```
