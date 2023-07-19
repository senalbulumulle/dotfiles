## Prompt the user to enter the name of the container
echo "Please enter the name of the container: "

read name

## Create an arch linux container with the name that is provided 
distrobox create -i docker.io/archlinux:latest --init --name $name
