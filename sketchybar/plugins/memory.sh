#!/bin/bash

PAGE_SIZE=$(vm_stat | awk '/page size/ {print $8}')
ACTIVE=$(vm_stat | awk '/Pages active/ {gsub(/\./, "", $3); print $3+0}')
WIRED=$(vm_stat | awk '/Pages wired down/ {gsub(/\./, "", $4); print $4+0}')
COMPRESSED=$(vm_stat | awk '/Pages occupied by compressor/ {gsub(/\./, "", $5); print $5+0}')

USED_GB=$(awk "BEGIN {printf \"%.1f\", ($ACTIVE + $WIRED + $COMPRESSED) * $PAGE_SIZE / 1073741824}")

sketchybar --set "$NAME" label="${USED_GB}G"
