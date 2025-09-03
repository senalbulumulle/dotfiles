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
        alias lsl='tree'
        alias markdown='open /Applications/MarkText.app/'
        alias createtemplate='sh scripts/create-template.sh'
        alias organizefbext='sh scripts/01-organize-folders-file-extensions.sh'
        alias lvim='/Users/senal/.local/bin/lvim'
end 
