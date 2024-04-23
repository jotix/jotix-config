#!/usr/bin/env bash

case $@ in
    jtx)
	SYSTEM_LABEL=jtx-nixos
	EFI_LABEL=JTX-EFI
	;;
    ffm)
	SYSTEM_LABEL=ffm-nixos
	EFI_LABEL=FFM-EFI
	;;
    *)
	echo "Wrong argument. The valid options are jtx or ffm"
	exit

sudo mount LABEL=$SYSTEM_LABEL /mnt
sudo btrfs subvolume create /mnt/nixos
sudo btrfs subvolume create /mnt/nixos/root
sudo btrfs subvolume create /mnt/nixos/home
sudo umount /mnt

sudo mount LABEL=$SYSTEM_LABEL /mnt -osubvol=/nixos/root
sudo mkdir -p /mnt/home
sudo mount LABEL=$SYSTEM_LABEL /mnt/home -osubvol=/nixos/home
sudo mkdir -p /mnt/boot/efi
sudo mount LABEL=$EFI_LABEL /mnt/boot/efi
