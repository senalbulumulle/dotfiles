## 03-install-claude.sh
## This script allows the ability to install claude


cd /tmp
git clone https://aur.archlinux.org/claude-code
cd claude-code
makepkg -si
rm -rf /tmp/claude-code