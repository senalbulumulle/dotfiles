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
        


# The compose binary has been installed into /usr/local/bin but it is not in the 
# system path. You should add it manually if you want to use compose from cli.




# How to use Compose
# Run podman compose up (podman CLI v4.7.0+) or docker-compose in a 
# directory with a compose.yaml. Podman Desktop will automatically 
# detect the Compose deployment and show it in the container list.'
# 
# $ podman compose up
