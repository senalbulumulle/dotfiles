## install-hyprland-debian.sh
## This script is used to compile and install hyprland on Debian 12 pretty much
## THIS MIGHT BREAK LIBRARIES IN DEBIAN THO...

## The first thing to obviously do is to update the packages via APT
sudo apt update -y && sudo apt full-upgrade -y 

## The second thing to do is to install the required dependencies for it
sudo apt install meson -y
sudo apt install wget -y 
sudo apt install build-essential -y 
sudo apt install ninja-build -y 
sudo apt install cmake-extras -y 
sudo apt install cmake -y
sudo apt install gettext -y
sudo apt install gettext-base -y 
sudo apt install fontconfig -y
sudo apt install libfontconfig-dev -y
sudo apt install libffi-dev -y 
sudo apt install libxml2-dev -y
sudo apt install libdrm-dev -y
sudo apt install libxkbcommon-x11-dev -y
sudo apt install libxkbregistry-dev -y
sudo apt install libxkbcommon-dev -y
sudo apt install libpixman-1-dev -y
sudo apt install libudev-dev -y 
sudo apt install libseat-dev -y
sudo apt install seatd -y
sudo apt install libxcb-dri13-dev -y
sudo apt install libvulkan-dev -y
sudo apt install libegl-dev -y
sudo apt install libgles2 -y
sudo apt install libegl1-mesa-dev -y
sudo apt install glslang-tools -y
sudo apt install libinput-bin -y
sudo apt install libinput-dev -y
sudo apt install libxcb-composite0-dev -y
sudo apt install libavutil-dev -y 
sudo apt install libavcodec-dev -y
sudo apt install libavformat-dev -y
sudo apt install libxcb-ewmh2 -y
sudo apt install libxcb-dwmh-dev -y
sudo apt install libxcb-present-dev -y
sudo apt install libxcb-icccm4-dev -y
sudo apt install libxcb-render-util0-dev -y 
sudo apt install libxcb-res0-dev -y
sudo apt install libxcb-xinput-dev -y
sudo apt install libpango1.0-dev -y
sudo apt install xdg-desktop-portal-wlr -y
sudo apt install hwdata -y
sudo apt install check -y
sudo apt install libgtk-3-dev -y
sudo apt install libsystemd-dev -y
sudo apt install xwayland -y
sudo apt install kitty -y


sudo apt install cmake-extras -y 
sudo apt install cmake -y
sudo apt install gettext -y
sudo apt install gettext-base -y 
sudo apt install fontconfig -y
sudo apt install libfontconfig-dev -y
sudo apt install libffi-dev -y 
sudo apt install libxml2-dev -y
sudo apt install libdrm-dev -y
sudo apt install libxkbcommon-x11-dev -y
sudo apt install libxkbregistry-dev -y
sudo apt install libxkbcommon-dev -y
sudo apt install libpixman-1-dev -y
sudo apt install libudev-dev -y 
sudo apt install libseat-dev -y
sudo apt install seatd -y
sudo apt install libxcb-dri13-dev -y
sudo apt install libvulkan-dev -y
