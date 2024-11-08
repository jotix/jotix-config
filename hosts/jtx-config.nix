# jtx-nixos hosts configuration

{ pkgs, ... }:

{

  networking = {
    hostName = "jtx-nixos";
  };

  hardware.keyboard.qmk.enable = true;

  environment.systemPackages = with pkgs; [
    qmk
    qmk-udev-rules
    vial
  ];

  ### NixOS
  fileSystems."/mnt/NixOS" = {
    device = "/dev/disk/by-label/NixOS";
    fsType = "btrfs";
    options = [ "subvol=/" ];
  };

  ### jtx-ssd
  fileSystems."/mnt/jtx-ssd" = {
    device = "/dev/disk/by-label/jtx-ssd";
    fsType = "btrfs";
    options = [ "subvol=/" ];
  };

  ### jtx-ssd
  fileSystems."/mnt/jtx-nvme" = {
    device = "/dev/disk/by-label/jtx-nvme";
    fsType = "btrfs";
    options = [ "subvol=/" ];
  };

  ### steam
  #programs.steam.enable = true;
  #hardware.steam-hardware.enable = true;
  #programs.gamemode.enable = true;

  ### flatpak
  #services.flatpak.enable = true;

  hardware.bluetooth.enable = true;
}
