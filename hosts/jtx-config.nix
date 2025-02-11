# jtx-nixos hosts configuration

{ ... }:

{
  ### options
  qmk.enable = true;
  #plasma.enable = false;
  #gnome.enable = true;

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

  # ### sddm refresh rate
  services.xserver.displayManager.setupCommands = ''
    kscreen-doctor output.HDMI-A-1.position.0,0 output.HDMI-A-1.mode.17
    xrandr --output HDMI-A-1 --mode 3840x2160 --rate 60
  '';

}
