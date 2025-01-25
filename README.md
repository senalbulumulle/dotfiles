# Senal's Configuration Files


Senal's own dotfiles manager


## Installing dots on the fly

In order to install dots on the fly, you need to use this link and paste it on the terminal
in order to make it work

``` shell
curl -s https://raw.githubusercontent.com/senalbulumulle/dotfiles/refs/heads/main/install.sh | bash
```

### Install Senal's setup files for mac laptop

`curl -s https://raw.githubusercontent.com/senalbulumulle/dotfiles/refs/heads/main/scripts/setup-mac-laptop.sh | bash`

### Install Senal's Dad's setup files for mac laptop

`curl -s https://raw.githubusercontent.com/senalbulumulle/dotfiles/refs/heads/main/scripts/setup-mac-laptop-dad.sh | bash`


## Sync Dots on the Mac (This section might be removed soon)

In this section, we are going to be talking about how to sync dots on the Mac. 

Syncing dots on the mac, the way that I made, makes it efficient to sync
my dotfiles on every Mac Device. Very Efficient Indeed....

1. `cd scripts/`
2. `sh setup-mac-laptop.sh`



## Any Suggestions to my dotfiles?



## TODO

    - Symlink the files to dotfiles to .config and others [SOMEWHAT COMPLETED]


## Changes

- Updated Cargo Packages

```
Updated miniz_oxide v0.8.2 -> v0.8.3
Updated pin-project-lite v0.2.15 -> v0.2.16
Updated tokio v1.42.0 -> v1.43.0

```


## Other notes

```
ln -s /Users/$USER/dotfiles/.vimrc /Users/$USER/.vimrc
ln -s /Users/$USER/dotfiles/.zshrc /Users/$USER/.zshrc
ln -s /Users/$USER/dotfiles/fish /Users/$USER/.config/fish
```
