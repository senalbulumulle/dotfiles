## configure-virt-manager.sh
## Simple script to auto configure for use of virt manager on Arch Linux 


function downloadDependencies() {
	sudo pacman -S virt-manager
	sudo pacman -S qemu-full
}


function enableStuff() {
	sudo systemctl enable libvirtd
	sudo systemctl start libvirtd
}

downloadDependencies
enableStuff
