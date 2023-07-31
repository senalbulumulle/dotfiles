#!/bin/bash

# Get the Hardware model name
model=$(sudo dmidecode -s system-product-name)

# Get the firmware version
firmware=$(sudo dmidecode -s bios-version)

# Print the hardware model and firmware version
echo "Hardware Model: $model"
echo "Firmware Version: $firmware"
