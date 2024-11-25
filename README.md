# Jotix's NixOS instalation guide

## List availables disks
To list the disk availables type:

    sudo parted -l

## Run the pre-install script
    
REPLACE THE DISK & HOST IN THE SCRIPT

    # replace the diskname
    DISK=/dev/XXXXXX
    HOST=xxx-nixos

    # make a new GPT partition table
    sudo parted $DISK mklabel gpt
    
    # make EFI & btrfs partitions
    sudo parted --align optimal -- $DISK mkpart NIXOS-BOOT fat32 1M 1G
    sudo parted --align optimal -- $DISK mkpart NixOS btrfs 1GiB 100%
    
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
    
## Final Steps

Unmount the partitions, reboot, and enjoy the new system...

