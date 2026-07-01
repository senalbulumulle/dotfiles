#!/bin/bash

PERCENTAGE=$(pmset -g batt | grep -Eo "[0-9]+%" | tr -d '%')
CHARGING=$(pmset -g batt | grep 'AC Power')

if [[ -z "$PERCENTAGE" ]]; then
  sketchybar --set "$NAME" icon="󰂑" label="?"
  exit 0
fi

if [[ -n "$CHARGING" ]]; then
  ICON="󰂄"
  COLOR=0xff32d74b
elif [[ "$PERCENTAGE" -ge 75 ]]; then
  ICON="󰁹"
  COLOR=0xff32d74b
elif [[ "$PERCENTAGE" -ge 50 ]]; then
  ICON="󰁾"
  COLOR=0xffececec
elif [[ "$PERCENTAGE" -ge 25 ]]; then
  ICON="󰁼"
  COLOR=0xffffcc00
elif [[ "$PERCENTAGE" -ge 10 ]]; then
  ICON="󰁺"
  COLOR=0xffff9f0a
else
  ICON="󰁺"
  COLOR=0xffff453a
fi

sketchybar --set "$NAME" icon="$ICON" icon.color="$COLOR" label="${PERCENTAGE}%"
