## virt-manager-install-arch.sh



sudo pacman -S qemu-full --noconfirm
sudo pacman -S libvirt --noconfirm
sudo pacman -S virt-manager --noconfirm


sudo systemctl enable libvirt
sudo systemctl start libvirt
