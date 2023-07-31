#########################################################
#		create-container
#
#	  Create containers more easily on distrobox
#########################################################

function createContainer() {
	clear

	echo "Please name the new container for Arch Linux"

	read name

	distrobox create --clone Arch-Linux-Template --name $name
	distrobox enter $name
		
}

createContainer
