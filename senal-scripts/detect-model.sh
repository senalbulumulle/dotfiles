#!/bin/bash

# Get the System76 model name
model=$(sudo dmidecode -s system-product-name)

# Get the firmware version
firmware=$(sudo dmidecode -s bios-version)

# Print the System76 model and firmware version
echo "System76 Model: $model"
echo "Firmware Version: $firmware"
