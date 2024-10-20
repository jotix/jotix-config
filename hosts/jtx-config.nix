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

  ### jtx-ssd
  fileSystems."/mnt/jtx-ssd" = {
    device = "/dev/disk/by-label/jtx-ssd";
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
