## install-virtualbox.sh
## Script to install virtualbox as well as configurating kernel modules 
## to successfully run virtualbox

function download() {
	sudo pacman -S virtualbox
}

function configureStuff() {

	cd /etc/modules-load.d/
	sudo touch virtualbox.conf
	sudo echo """
	vboxdrv

	""" >> virtualbox.conf
}

function reload() {
 	sudo modprobe vboxdrv
}
download
configureStuff
reload	
