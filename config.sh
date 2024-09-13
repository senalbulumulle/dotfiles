## config.sh



rm -rf /home/$USER/.config/fish/config.fish
echo """
## Senal's Fish config for macOS and Linux 

if status is-interactive
    alias microconfig='micro $HOME/.config/micro/settings.json'
    alias vimconfig='vim $HOME/.vimrc'
    alias bashconfig='micro $HOME/.bashrc'
    alias fishconfig='micro $HOME/.config/fish/config.fish'
    alias zshconfig='micro $HOME/.zshrc'
    alias neovideconfig='echo "not available yet"'
    alias v='nvim'
    alias m='micro'
    alias markdown='open /Applications/MarkText.app/'
    alias l='ls -l'
    alias ll='ls -la'
    alias lll='ls -lll'
end


"""	>> /home/$USER/.config/fish/config.fish
