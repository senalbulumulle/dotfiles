## Allows the ability to turn on macOS single window mode on
alias mswmo="defaults write com.apple.dock single-app-mode -bool TRUE && killall Dock"
## Allows the ability to turn off macOS single window mode off
alias mswmoo="defaults write com.apple.dock single-app-mode -bool FALSE && killall Dock"
