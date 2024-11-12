# jtx-nixos hosts configuration

{ pkgs, ... }:

{

  networking = {
    hostName = "jtx-nixos";
  };

  gnome.enable = true;
  plasma.enable = false;

  hardware.keyboard.qmk.enable = true;

  environment.systemPackages = with pkgs; [
    qmk
    qmk-udev-rules
    vial
  ];

  ### jtx-nvme
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
