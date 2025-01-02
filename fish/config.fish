## Senal's Fish config for macOS and Linux 

if status is-interactive
    ## Configure the Micro Editor Config
    alias microconfig='micro $HOME/.config/micro/settings.json'
    ## Configure the Vim Editor Config
    alias vimconfig='vim $HOME/.vimrc'
    ## Configure the Bash Shell Config
    alias bashconfig='micro $HOME/.bashrc'
    ## Configure the Fish Shell Config
    alias fishconfig='micro $HOME/.config/fish/config.fish'
    ## Configure the Zsh Shell Config
    alias zshconfig='micro $HOME/.zshrc'
    alias neovideconfig='echo "not available yet"'
    alias v='nvim'
    alias m='micro'
    alias markdown='open /Applications/MarkText.app/'
end
