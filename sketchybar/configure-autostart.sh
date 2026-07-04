## configure-autostart.sh

## Configures macOS to start sketchybar automatically at login.
## Uses brew services, which installs a LaunchAgent at
## ~/Library/LaunchAgents/homebrew.mxcl.sketchybar.plist that starts
## sketchybar at login and restarts it if it ever crashes.

if brew services list | grep -q "^sketchybar[[:space:]]*started"; then
    echo "sketchybar autostart is already configured and running"
else
    brew services start sketchybar
    echo "sketchybar autostart configured"
fi
