# Requirements

To proced with the installation make the following partitions:

    +-----------------+-------------+
    | partition type  | label       |
    |-----------------+-------------|
    | FAT32 (ef00)    | NIXOS-EFI   |
    | btrfs           | NixOS       |
    +-----------------+-------------+

Mount the partitions

	sudo mount LABEL=NixOS /mnt
	sudo btrfs subvolume create /mnt/@
	sudo btrfs subvolume create /mnt/@nix
	sudo btrfs subvolume create /mnt/@home
	sudo umount -R /mnt

	sudo mount LABEL=NixOS /mnt -osubvol=/@
	sudo mkdir -p /mnt/home
	sudo mkdir -p /mnt/nix
	sudo mkdir -p /mnt/boot/efi
 
	sudo mount LABEL=NixOS /mnt/home -osubvol=/@home
	sudo mount LABEL=NixOS /mnt/nix -osubvol=/@nix
	sudo mount LABEL=NIXOS-EFI /mnt/boot/efi

# Update flake

Optional: to update the flake, run the following command:

	nix flake update --extra-experimental-features 'nix-command flakes'

# Install the new system

To install the new system run the following command:

	sudo nixos-install --flake .#[hostname]

# copy nixos-config folder to the new installation

If changes are made in any file of this repo, copy it to
the new installation if you don't want to loose
the changes.

	sudo cp -rv ~/nixos-config /mnt/home/jotix/

# set jotix's password

Set the password for the new installation,

	sudo nixos-enter --command 'passwd jotix'

# Final Steps

Unmount the partitions, reboot, and enjoy the new system...

