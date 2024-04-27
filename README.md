# Jotix's NixOs configuration
## Requirements

To proced with the installation make the following partitions:

- FAT32, efi(ef00) - LABEL=JTX-EFI / FFM-EFI
- BTRFS filesystem for the new installation - LABEL=jtx-nixos / ffm-nixos 

Run the script make the btrfs subvolumes and mounting them

    $ ./script/mount-fs.sh

## hosts

- jtx-nixos: personal home computer
- ffm-nixos: business computer

## Update flake

Optional: to update the flake, run the following command:

    $ nix flake update --extra-experimental-features 'nix-command flakes'

** Install the new system

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

