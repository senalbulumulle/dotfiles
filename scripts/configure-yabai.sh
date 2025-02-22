# Install Yabai and Skhd
echo "Installing Yabai and Skhd..."
brew install koekeishiya/formulae/yabai
brew install koekeishiya/formulae/skhd

# Install Yabai as a system service
echo "Installing Yabai service..."
sudo yabai --install-service

# Prompt user to enable Accessibility permissions manually
echo "Go to System Settings → Privacy & Security → Accessibility"
echo "Enable 'yabai' and 'skhd', then press Enter to continue..."
read -r

# Create Yabai configuration file
echo "Configuring Yabai..."
cat > ~/.yabairc <<EOF
#!/bin/bash

yabai -m config layout bsp
yabai -m config top_padding 10
yabai -m config bottom_padding 10
yabai -m config left_padding 10
yabai -m config right_padding 10
yabai -m config window_gap 5

yabai -m config focus_follows_mouse autofocus
yabai -m config window_placement second_child
yabai -m config mouse_modifier fn
yabai -m config mouse_action1 move
yabai -m config mouse_action2 resize
EOF

chmod +x ~/.yabairc

# Create Skhd configuration file
echo "Configuring Skhd for keybindings..."
cat > ~/.skhdrc <<EOF
# Focus windows with Vim keys
alt - h : yabai -m window --focus west
alt - j : yabai -m window --focus south
alt - k : yabai -m window --focus north
alt - l : yabai -m window --focus east

# Move windows
shift + alt - h : yabai -m window --warp west
shift + alt - j : yabai -m window --warp south
shift + alt - k : yabai -m window --warp north
shift + alt - l : yabai -m window --warp east

# Resize windows
ctrl + alt - h : yabai -m window --resize left:-20:0
ctrl + alt - j : yabai -m window --resize bottom:0:20
ctrl + alt - k : yabai -m window --resize top:0:-20
ctrl + alt - l : yabai -m window --resize right:20:0

# Rotate tree
alt - r : yabai -m space --rotate 90
EOF

chmod +x ~/.skhdrc

# Start Yabai and Skhd services
echo "Starting Yabai and Skhd services..."
brew services start yabai
brew services start skhd

echo "Yabai and Skhd have been successfully installed and configured!"
echo "You may need to log out and log back in for all settings to apply."
