<center>
<img src="./senal-dotfiles.png">
</center>>


Senal's own dotfiles manager

## Introduction
Senal's wonderful dotfiles manager allows the ability to get inspired and 
get creative and be innovative with talent. 

With Senal's dotfiles manager, you realize the organization of setups that
Senal has will definitely makes you want to do something.


# SymLinking .vimrc Config on macOS 🔗

```
ln -s /Users/$USER/dotfiles/.vimrc /Users/$USER/.vimrc
```


# SymLinking .zshrc Config on macOS 🔗
```
ln -s /Users/$USER/dotfiles/.zshrc /Users/$USER/.zshrc
```


# SymLinking emacs Config on macOS 🔗
```
ln -f /Users/$USER/dotfiles/.emacs /Users/$USER/.emacs
```

# SymLinking Fish Config on macOS 🔗
```
ln -s /Users/$USER/dotfiles/fish /Users/$USER/.config/fish
```


# SymLinking Micro Config on macOS 🔗
```
ln -s /Users/$USER/dotfiles/micro /Users/$USER/.config/micro
```



# SymLinking Neovim Config on macOS 🔗

In this section, we are going to be talking about symlinking neovim configurations on 
macOS. When it comes to neovim distributions, the neovim distributions are modified 
by Senal, for the use of learning the gists of neovim in general.

## Symlinking (macOS) Senal's Neovim Official Config

This is Senal's Official NEOVIM Config


```
rm -rf /Users/$USER/.local/share/nvim
rm -rf /Users/$USER/.config/nvim
ln -s /Users/$USER/dotfiles/nvim /Users/$USER/.config/nvim
```




## Symlinking (macOS) AstroNvim Config

```
rm -rf /Users/$USER/.local/share/nvim
rm -rf /Users/$USER/.config/nvim
ln -s /Users/$USER/dotfiles/AstroNvim /Users/$USER/.config/nvim
```



## Symlinking (macOS) NvChad Config
```
rm -rf /Users/$USER/.local/share/nvim
rm -rf /Users/$USER/.config/nvim
ln -s /Users/$USER/dotfiles/NvChad /Users/$USER/.config/nvim
```
