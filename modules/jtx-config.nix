# jtx-nixos hosts configuration

{ pkgs, ... }:

{
  networking = {
    hostName = "jtx-nixos";
  };

  services.xserver.xkb = {
    layout = "us";
    variant = "altgr-intl";
  };

  hardware.keyboard.qmk.enable = true;

  environment.systemPackages = with pkgs; [
    qmk
    qmk-udev-rules
    vial
  ];

    ### jtx-ssd
  # fileSystems."/mnt/jtx-ssd" = {
  #   device = "/dev/disk/by-label/jtx-ssd";
  #   fsType = "btrfs";
  #   options = [ "subvol=/" ];
  # };

  ### jtx-nvme
  fileSystems."/mnt/jtx-nvme" = {
    device = "/dev/disk/by-label/jtx-nvme";
    fsType = "btrfs";
    options = [ "subvol=/" ];
  };

  hardware.bluetooth.enable = true;
}
