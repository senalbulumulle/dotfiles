#!/bin/bash

# Hyprland Monitor Toggle Script
# Usage: ./toggle-monitors.sh [hdmi-only|laptop-only|both]

case "$1" in
    hdmi-only)
        echo "Disabling laptop monitor, showing only HDMI..."
        hyprctl keyword monitor eDP-1,disable
        hyprctl keyword monitor HDMI-A-1,preferred,auto,1
        ;;
    laptop-only)
        echo "Disabling HDMI monitor, showing only laptop..."
        hyprctl keyword monitor HDMI-A-1,disable
        hyprctl keyword monitor eDP-1,preferred,auto,1
        ;;
    both)
        echo "Enabling both monitors..."
        hyprctl keyword monitor eDP-1,preferred,auto,1
        hyprctl keyword monitor HDMI-A-1,preferred,auto,1
        ;;
    *)
        echo "Usage: $0 [hdmi-only|laptop-only|both]"
        echo ""
        echo "Options:"
        echo "  hdmi-only    - Show only HDMI monitor"
        echo "  laptop-only  - Show only laptop monitor"
        echo "  both         - Show both monitors"
        exit 1
        ;;
esac
