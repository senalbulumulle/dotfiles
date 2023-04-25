#########################################################
#		create-container
#
#	  Create containers more easily on distrobox
#########################################################


#!/bin/bash

# Prompt the user for the container name
read -p "Enter a name for the new container: " container_name

# Create the container using the distrobox command
distrobox create -i docker.io/archlinux:latest --init --name "$container_name"

# Install some packages using pacman
distrobox run "$container_name" pacman -Syu --noconfirm
distrobox run "$container_name" pacman -S --noconfirm git tmux vim python

# Configure some settings
distrobox run "$container_name" git config --global user.name "Your Name"
distrobox run "$container_name" git config --global user.email "your@email.com"
distrobox run "$container_name" echo "export EDITOR=vim" >> ~/.bashrc

echo "Container '$container_name' is now ready!"
