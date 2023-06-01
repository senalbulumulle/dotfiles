clear
read -p """
###################################################
	Please specify a name of the container
		     to clone: 
###################################################
"""  name_of_container

distrobox create --clone fedora-35 --name $name_of_container
