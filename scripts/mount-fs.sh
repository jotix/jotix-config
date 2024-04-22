sudo mount LABEL=system /mnt
sudo btrfs subvolume create /mnt/nixos
sudo btrfs subvolume create /mnt/nixos/root
sudo btrfs subvolume create /mnt/nixos/home
sudo umount /mnt

sudo mount LABEL=system /mnt -osubvol=/nixos/root
sudo mkdir -p /mnt/home
sudo mount LABEL=system /mnt/home -osubvol=/nixos/home
sudo mkdir -p /mnt/boot/efi
sudo mount LABEL=EFI /mnt/boot/efi
