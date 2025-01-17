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

  ### sddm refresh rate
  services.xserver.displayManager.setupCommands = ''
    kscreen-doctor output.HDMI-A-1.position.0,0 output.HDMI-A-1.mode.3840x2160@60
  '';

  boot.kernelParams = [
    #"video=DP-1:1920x1080@60"
    "video=HDMI-A-1:3840x2160@60"
  ];

}
