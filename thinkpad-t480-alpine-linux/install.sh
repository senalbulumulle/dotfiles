#!/bin/sh
## install.sh

## One-time setup script for a full i3 window manager desktop on this
## ThinkPad T480 running Alpine Linux. Installs Xorg, i3 plus its usual
## companion tools (status bar, lock screen, launcher, compositor,
## notifications, networking, audio), and writes a ~/.xinitrc for the
## target user.
##
## Alpine's base install does not include bash, so this is POSIX /bin/sh.
##
## Usage (run as root, e.g. via doas):
##   doas sh install.sh <username>

set -e

if [ "$(id -u)" -ne 0 ]; then
    echo "Run this script as root, e.g.: doas sh install.sh <username>" >&2
    exit 1
fi

TARGET_USER="${1:-${SUDO_USER:-${DOAS_USER:-}}}"
if [ -z "$TARGET_USER" ] || [ "$TARGET_USER" = "root" ]; then
    echo "Usage: $0 <username>" >&2
    echo "  <username> must be the regular (non-root) account that will run i3." >&2
    exit 1
fi

TARGET_HOME="$(getent passwd "$TARGET_USER" | cut -d: -f6)"
if [ -z "$TARGET_HOME" ]; then
    echo "No such user: $TARGET_USER" >&2
    exit 1
fi

echo "Enabling the community repository"
sed -i '/^#.*\/community$/s/^#//' /etc/apk/repositories
if ! grep -q '^[^#].*/community' /etc/apk/repositories; then
    echo "Could not find a community repo line in /etc/apk/repositories." >&2
    echo "Add one manually (matching your main repo line) and re-run this script." >&2
    exit 1
fi

echo "Updating package index"
apk update

echo "Setting up Xorg"
setup-xorg-base

echo "Installing i3 and its companion tools"
apk add \
    i3wm i3status i3lock i3blocks dmenu rofi \
    picom dunst feh scrot xclip xautolock brightnessctl \
    font-dejavu font-terminus font-awesome \
    kitty \
    dbus

echo "Installing networking (NetworkManager)"
apk add networkmanager networkmanager-openrc network-manager-applet

## No polkit is installed, so let netdev-group members manage the
## network directly instead of NetworkManager rejecting them.
mkdir -p /etc/NetworkManager/conf.d
cat > /etc/NetworkManager/conf.d/10-no-polkit.conf <<'EOF'
[main]
auth-polkit=false
EOF

echo "Installing audio (PipeWire)"
apk add pipewire pipewire-pulse pipewire-alsa wireplumber alsa-utils pavucontrol pamixer

echo "Enabling services"
rc-update add dbus
rc-update add networkmanager
rc-service dbus start
rc-service networkmanager start

echo "Adding $TARGET_USER to the required groups"
for grp in input video audio netdev plugdev; do
    if getent group "$grp" >/dev/null; then
        adduser "$TARGET_USER" "$grp"
    fi
done

echo "Writing $TARGET_HOME/.xinitrc"
XINITRC="$TARGET_HOME/.xinitrc"
if [ -f "$XINITRC" ]; then
    cp "$XINITRC" "$XINITRC.bak.$(date +%s)"
fi
cat > "$XINITRC" <<'EOF'
#!/bin/sh

# Per-session D-Bus, needed by dunst, nm-applet, pavucontrol, etc.
if [ -z "$DBUS_SESSION_BUS_ADDRESS" ]; then
    eval "$(dbus-launch --sh-syntax --exit-with-session)"
fi

pipewire &
pipewire-pulse &
wireplumber &

picom &
dunst &
nm-applet &
xautolock -time 10 -locker "i3lock -c 000000" &

# Point this at a real image once you have one:
# feh --bg-fill "$HOME/.config/i3/wallpaper"

exec i3
EOF
chown "$TARGET_USER":"$TARGET_USER" "$XINITRC"
chmod +x "$XINITRC"

echo
echo "Done. Log in as $TARGET_USER and run 'startx' to launch i3."
echo "On first launch, i3 offers to generate its default config at ~/.config/i3/config."
