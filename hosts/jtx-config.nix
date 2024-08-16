# jtx-nixos hosts configuration

{ pkgs, ... }:

{

  ### home-manager modules
  home-manager.users.jotix = {
    emacs.enable = true;
  };

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

  hardware.bluetooth.enable = true;
}
