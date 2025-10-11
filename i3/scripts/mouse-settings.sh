#!/bin/bash
# Mouse sensitivity settings for i3

# Reduce mouse sensitivity by setting negative acceleration speed
# Range: -1.0 (slowest) to 1.0 (fastest), default is 0.0
# Using -0.5 for reduced sensitivity
xinput --set-prop "Razer Razer Basilisk V3 X HyperSpeed Mouse" "libinput Accel Speed" -0.2

# Optionally, you can switch to flat acceleration profile (no acceleration)
# This makes mouse movement 1:1 with physical movement
# Uncomment the next line if you prefer no acceleration at all:
# xinput --set-prop "Razer Razer Basilisk V3 X HyperSpeed Mouse" "libinput Accel Profile Enabled" 0, 1, 0

# Also reduce touchpad sensitivity
xinput --set-prop "ETPS/2 Elantech Touchpad" "libinput Accel Speed" -0.4

# If you want even slower, change -0.5 to -0.7 or -0.8
# If you want slightly faster, use -0.3 or -0.2
