#!/usr/bin/env bash

echo
lsblk -o +LABEL
echo 
read -p "In which disk will NixOS be instaled: " DISK
if [[ ! -b $DISK ]]; then
    echo "The disk $DISK doesn't exist."
    exit
fi

echo 
read -p "Wich Flake install (jtx or ffm): " HOST
if [[ $HOST != "jtx" ]] && [[ $HOST != "ffm" ]]; then
    echo "Flake incorrecto"
    exit
fi
HOST=$HOST-nixos

echo 
read -p "The disk $DISK will be complete deleted. Continue? (yes/no)" CONTINUE
[[ $CONTINUE != "yes" ]] && exit

echo 
read -p "REALLY? (YES/NO)" CONTINUE
[[ $CONTINUE != "YES" ]] && exit

echo
echo "Installing NixOS in $DISK"
echo "Flake: $HOST"
echo

# make a new GPT partition table
sudo parted $DISK mklabel gpt

# make EFI & btrfs partitions
sudo parted --align optimal -- $DISK mkpart NIXOS-BOOT fat32 1M 1G
sudo parted --align optimal -- $DISK mkpart NixOS btrfs 1G 100%

# set esp flag in EFI partition
sudo parted $DISK set 1 esp on

# make the filesystems
sudo mkfs.vfat -F32 -n NIXOS-BOOT /dev/disk/by-partlabel/NIXOS-BOOT
sudo mkfs.btrfs -L NixOS /dev/disk/by-partlabel/NixOS -f

# mount the disk & create the subvolumes
sudo mount LABEL=NixOS /mnt
sudo btrfs subvolume create /mnt/@
sudo btrfs subvolume create /mnt/@nix
sudo btrfs subvolume create /mnt/@home
sudo umount -R /mnt

# make the directories
sudo mount LABEL=NixOS /mnt -osubvol=/@
sudo mkdir -p /mnt/home
sudo mkdir -p /mnt/nix
sudo mkdir -p /mnt/boot

# mount all in the right place
sudo mount LABEL=NixOS /mnt/home -osubvol=/@home
sudo mount LABEL=NixOS /mnt/nix -osubvol=/@nix
sudo mount LABEL=NIXOS-BOOT /mnt/boot

# Otional: clone this repository locally
#git clone https://github.com/jotix/nixos-config.git
#cd nixos-config
#update flake
#nix flake update --extra-experimental-features 'nix-command flakes'
#sudo nixos-install --flake .#$HOST

# Install new system
sudo nixos-install --flake "github:jotix/nixos-config/#$HOST"

# set jotix's password
sudo nixos-enter --command 'echo "ENTER JOTIX PASSWORD" && passwd jotix'

# set filofem password
[[ HOST == "ffm-nixos" ]]  && sudo nixos-enter --command 'echo "ENTER FILOFEM PASSWORD" && passwd filofem'
