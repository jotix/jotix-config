# Jotix's NixOs configuration

## Requirements


To proced with the installation the following partitions are required:

- LABEL=EFI : FAT32, efi(ef00)
- LABEL=nixos : the root filesystem for the new installation

Format and mount the necesary partitions:

    $ sudo mount LABEL=nixos /mnt

    $ sudo mkdir -p /mnt/boot/efi
    
    $ sudo mount LABEL=EFI /mnt/boot/efi 

## hosts

- jtx-nixos: personal home computer
- ffm-nixos: business computer

## Update flake 

Optional: to update the flake, run the following command:

    $ nix flake update --extra-experimental-features 'nix-command flakes'

## Install the new system

To install the new system run the following command:

    $ sudo nixos-install --flake .#[hostname]

## copy nixos-config folder to the new installation

If changes are made in any file of this repo, copy it to
the new installation if you don't want to loose
the changes, run the following script:

    $ ./scripts/cp-nixos-config.sh

## set jotix's password

Set the password for the new installation,
run the script:

    $ ./scripts/set-jotix-password.sh

## Final Steps

Unmount the partitions, reboot, and enjoy the new system...
