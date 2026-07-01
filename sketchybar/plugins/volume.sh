#!/bin/bash

VOLUME=$(osascript -e "output volume of (get volume settings)")
MUTED=$(osascript -e "output muted of (get volume settings)")

if [[ "$MUTED" == "true" || "$VOLUME" -eq 0 ]]; then
  ICON="󰖁"
  COLOR=0xffff453a
elif [[ "$VOLUME" -lt 30 ]]; then
  ICON="󰕿"
  COLOR=0xffececec
elif [[ "$VOLUME" -lt 70 ]]; then
  ICON="󰖀"
  COLOR=0xffececec
else
  ICON="󰕾"
  COLOR=0xffececec
fi

sketchybar --set "$NAME" icon="$ICON" icon.color="$COLOR" label="${VOLUME}%"
