# Jotix's NixOS instalation guide

## List availables disks
To list the disk availables type:

    sudo parted -l

## Download & run the pre-install script
    
	curl -o install.sh https://raw.githubusercontent.com/jotix/linux-config/refs/heads/main/nixos-install.sh

Make the script executable & run it

	chmod +x install.sh
	./install.sh

## Final Steps

Unmount the partitions, reboot, and enjoy the new system...

