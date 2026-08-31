#!/usr/bin/env bash
## install-vm-tools.sh

## Sets up this machine as a KVM/QEMU + virt-manager host capable of GPU
## passthrough (VFIO), so a VM can drive an external/secondary GPU directly
## while this machine's own display GPU stays untouched.
##
## Run this on the physical machine that holds the passthrough hardware.
## Two reboots are effectively needed: one after the GRUB/IOMMU change, and
## a check afterwards to confirm the vfio-pci binding took effect before
## starting a VM.

set -e

confirm() {
    read -r -p "$1 [y/N] " reply
    [[ "$reply" =~ ^[Yy]$ ]]
}

echo "== Checking virtualization support =="
if ! grep -qE 'vmx|svm' /proc/cpuinfo; then
    echo "No hardware virtualization (VT-x/AMD-V) detected in /proc/cpuinfo." >&2
    echo "Enable it in BIOS/UEFI first, then re-run this script." >&2
    exit 1
fi

if grep -q vmx /proc/cpuinfo; then
    IOMMU_PARAM="intel_iommu=on"
else
    IOMMU_PARAM="amd_iommu=on"
fi
echo "Detected CPU -> will use kernel parameter: $IOMMU_PARAM"

echo
echo "== Installing KVM/QEMU/virt-manager packages =="
sudo apt-get update
sudo apt-get install -y \
    qemu-kvm \
    libvirt-daemon-system \
    libvirt-clients \
    bridge-utils \
    virtinst \
    virt-manager \
    ovmf \
    cpu-checker

echo
echo "== Verifying KVM is usable =="
sudo kvm-ok

echo
echo "== Enabling libvirtd and adding $(whoami) to the libvirt/kvm groups =="
sudo systemctl enable --now libvirtd
sudo usermod -aG libvirt,kvm "$(whoami)"
echo "Group membership takes effect after you log out and back in (or reboot)."

echo
echo "== Configuring IOMMU in GRUB =="
GRUB_FILE=/etc/default/grub
if ! grep -q "$IOMMU_PARAM" "$GRUB_FILE"; then
    BACKUP="$GRUB_FILE.bak.$(date +%s)"
    sudo cp "$GRUB_FILE" "$BACKUP"
    sudo sed -i "s/^GRUB_CMDLINE_LINUX_DEFAULT=\"\(.*\)\"/GRUB_CMDLINE_LINUX_DEFAULT=\"\1 $IOMMU_PARAM iommu=pt\"/" "$GRUB_FILE"
    sudo update-grub
    echo "Added '$IOMMU_PARAM iommu=pt' to $GRUB_FILE (backup: $BACKUP)."
    GRUB_CHANGED=1
else
    echo "$IOMMU_PARAM already present in $GRUB_FILE, skipping."
fi

echo
echo "== Loading VFIO kernel modules at boot =="
cat <<'EOF' | sudo tee /etc/modules-load.d/vfio.conf > /dev/null
vfio
vfio_iommu_type1
vfio_pci
vfio_virqfd
EOF

echo
echo "== GPU passthrough device selection =="
echo "PCI display devices on this system:"
lspci -nnk | grep -A2 -Ei 'vga|3d controller|display controller'
echo
echo "Identify the PCI vendor:device IDs of the GPU to pass through to a VM."
echo "Do NOT select the GPU currently driving this machine's own display."
echo "Include its audio function too if it has one (e.g. 10de:1b80,10de:10f0)."
read -r -p "Vendor:device IDs to bind to vfio-pci, comma-separated (blank to skip): " VFIO_IDS

if [[ -n "$VFIO_IDS" ]]; then
    echo "About to bind these PCI IDs to vfio-pci at boot: $VFIO_IDS"
    if confirm "Confirm these are NOT the GPU driving this machine's own display:"; then
        cat <<EOF | sudo tee /etc/modprobe.d/vfio-pci.conf > /dev/null
options vfio-pci ids=$VFIO_IDS
softdep nvidia pre: vfio-pci
softdep nouveau pre: vfio-pci
softdep amdgpu pre: vfio-pci
softdep radeon pre: vfio-pci
EOF
        sudo update-initramfs -u
        echo "vfio-pci binding configured for: $VFIO_IDS"
        BIND_CHANGED=1
    else
        echo "Skipped vfio-pci binding. Re-run this script later to set it up."
    fi
else
    echo "No IDs entered, skipping GPU passthrough binding for now."
    echo "You can configure /etc/modprobe.d/vfio-pci.conf manually later."
fi

echo
echo "== Done =="
if [[ -n "${GRUB_CHANGED:-}" || -n "${BIND_CHANGED:-}" ]]; then
    echo "Reboot required for the IOMMU/vfio-pci changes to take effect."
fi
echo "After rebooting, verify with:"
echo "  lspci -nnk | grep -A2 -Ei 'vga|3d controller'"
echo "The passthrough GPU's 'Kernel driver in use' should read 'vfio-pci'."
echo "Then open virt-manager, create a VM using OVMF/UEFI firmware, and add"
echo "the GPU as a PCI Host Device under the VM's hardware details."
