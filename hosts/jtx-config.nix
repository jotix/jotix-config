# jtx-nixos hosts configuration

{ ... }:

{
  ### options
  qmk.enable = true;
  plasma.enable = false;
  gnome.enable = true;

  networking = {
    hostName = "jtx-nixos";
  };

  ### jtx-nvme
  fileSystems."/mnt/jtx-nvme" = {
    device = "/dev/disk/by-label/jtx-nvme";
    fsType = "btrfs";
    options = [ "subvol=/" ];
  };

  ### bluetooth
  hardware.bluetooth.enable = true;

  boot.kernelParams = [
    #"video=DP-1:1920x1080@60"
    "video=HDMI-A-1:3840x2160@60"
  ];

}
