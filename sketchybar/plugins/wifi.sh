#!/bin/bash

SSID=$(networksetup -getairportnetwork en0 2>/dev/null | sed 's/Current Wi-Fi Network: //')

if [[ "$SSID" == *"not associated"* || -z "$SSID" ]]; then
  sketchybar --set "$NAME" icon="󰤭" icon.color=0xffff453a label="No WiFi"
else
  sketchybar --set "$NAME" icon="󰤨" icon.color=0xff0a84ff label="$SSID"
fi
