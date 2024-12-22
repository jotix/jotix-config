# jtx-nixos hosts configuration

{ ... }:
let
  f1tv_script = ''
  #!/usr/bin/env bash
  export $(dbus-launch); kwin_wayland "firefox -P" &
  '';
in
{
  ### options
  qmk.enable = true;

  networking = {
    hostName = "jtx-nixos";
  };
  
  environment.shellAliases.f1tv = f1tv_script;
  
  ### jtx-nvme
  fileSystems."/mnt/jtx-nvme" = {
    device = "/dev/disk/by-label/jtx-nvme";
    fsType = "btrfs";
    options = [ "subvol=/" ];
  };

  ### bluetooth
  hardware.bluetooth.enable = true;

  boot.kernelParams = [
    "video=DP-1:3840x2160@60"
    "video=HDMI-A-1:1920x1080@60"
  ];
  
}
