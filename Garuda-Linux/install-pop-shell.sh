## install-pop-shell.sh

## Installs pop shell in Garuda Linux

## Written by Senal Bulumulle


function dependencies() {
	sudo pacman -S git --noconfirm
	sudo pacman -S typescript --noconfirm
	sudo pacman -S make --noconfirm
}

function process() {
	cd
	git clone https://github.com/pop-os/shell.git
	cd shell
	make local-install
}

dependencies
process
