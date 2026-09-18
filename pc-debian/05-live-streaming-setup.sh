#!/usr/bin/env bash
## 05-live-streaming-setup.sh

## Installs OBS Studio on Debian via the apt repo, plus the extras it needs
## for virtual camera output, hardware encoding, and Wayland screen capture.

set -e

echo "Updating package list"
sudo apt-get update

echo "Installing OBS Studio"
sudo apt-get install -y obs-studio

echo "Installing kernel headers for DKMS build"
sudo apt-get install -y "linux-headers-$(uname -r)"

echo "Installing v4l2loopback (virtual camera)"
sudo apt-get install -y v4l2loopback-dkms

echo "Configuring v4l2loopback to load on boot"
echo "v4l2loopback" | sudo tee /etc/modules-load.d/v4l2loopback.conf
echo 'options v4l2loopback exclusive_caps=1 card_label="OBS Virtual Camera"' | sudo tee /etc/modprobe.d/v4l2loopback.conf
sudo modprobe v4l2loopback exclusive_caps=1 card_label="OBS Virtual Camera"

echo "Installing hardware encoding drivers (VAAPI)"
sudo apt-get install -y mesa-va-drivers vainfo

echo "Installing Wayland screen-capture portal"
sudo apt-get install -y xdg-desktop-portal xdg-desktop-portal-gtk
