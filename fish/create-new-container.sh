#########################################################
#		create-container
#
#	  Create containers more easily on distrobox
#########################################################

function createNewContainer() {
	clear

	echo "Please name the new container **Default Fedora**"

	read name

	distrobox create --name $name
	distrobox enter $name
		
}

createNewContainer
