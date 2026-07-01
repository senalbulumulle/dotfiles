#!/bin/bash

CPU=$(top -l 1 -s 0 | awk '/CPU usage/ {
  idle = $(NF-1)
  sub(/%/, "", idle)
  printf "%.0f", 100 - idle
}')

sketchybar --set "$NAME" label="${CPU}%"
