sudo mount LABEL=jtx-system /mnt
sudo btrfs subvolume create /mnt/nixos
sudo btrfs subvolume create /mnt/nixos/root
sudo btrfs subvolume create /mnt/nixos/home
