#!/bin/bash
set -e

echo "Installing Brave Browser on Debian..."

# Update package list
sudo apt update

# Install dependencies
sudo apt install -y curl

# Add Brave's GPG key
curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

# Add Brave repository
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list

# Update package list again
sudo apt update

# Install Brave
sudo apt install -y brave-browser

echo "Brave Browser installed successfully!"
brave --version
