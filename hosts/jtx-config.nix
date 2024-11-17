# jtx-nixos hosts configuration

{ ... }:

{
  ### options
  qmk.enable = true;
  cups.enable = true;

  networking = {
    hostName = "jtx-nixos";
  };
  
  ### jtx-nvme
  fileSystems."/mnt/jtx-nvme" = {
    device = "/dev/disk/by-label/jtx-nvme";
    fsType = "btrfs";
    options = [ "subvol=/" ];
  };

  ### flatpak
  services.flatpak.enable = false;

  ### bluetooth
  hardware.bluetooth.enable = true;
}
