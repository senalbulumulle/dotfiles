#!/bin/sh

# compositor
killall picom
while pgrep -u $UID -x picom >/dev/null; do sleep 1; done
picom --config ~/.config/picom/picom.conf --vsync &

~/.config/i3/polybar/launch.sh &

#bg
#nitrogen --restore &
~/.fehbg &
clipmenud &
dunst &
autotiling &
pcloud & 
unclutter &

setxkbmap -option ctrl:nocaps &
#setxkbmap -layout colemak &

[ ! -s ~/.config/mpd/pid ] && mpd &
/usr/libexec/polkit-gnome-authentication-agent-1 &
#/usr/lib/polkit-kde-authentication-agent-1 &

#sxhkd
sxhkd -c $HOME/myrepo/i3/sxhkd/sxhkdrc &
