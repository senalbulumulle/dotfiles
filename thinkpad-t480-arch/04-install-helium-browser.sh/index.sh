## 04-install-helium-browser.sh
## This script allows the ability to install helium-browser


cd /tmp
git clone https://aur.archlinux.org/helium-browser-bin
cd helium-browser-bin
makepkg -si
rm -rf /tmp/helium-browser-bin