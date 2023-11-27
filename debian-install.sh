## debian-install.sh



## This will update and upgrade the packages 
sudo apt update -y && sudo apt full-upgrade -y



## This will install the virt-manager thing
sudo apt install libvirt* -y
sudo apt install qemu* -y
sudo apt install virt-manager* -y


## Enable the virtualization services thing
sudo systemctl enable libvirt
