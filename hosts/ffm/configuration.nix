# ffm-nixos configuration

{ ... }:

{
  ### NixOS Modules
  cups.enable = true;
  #exwm.enable = true;
  #gnome.enable = true;
  hyprland.enable = true;
  plasma.enable = true;
  #qmk.enable = true;
  #river.enable = true;
  steam.enable = true;
  #syncthing.enable = true;
  
  ### Host specific config
  networking.hostName = "ffm-nixos";
  
  # users.users.filofem = {
  #   isNormalUser = true;
  #   description = "FILOfem";
  #   extraGroups = [ "networkmanager" "libvirtd" ];
  # };
  
  services.xserver.xkb = {
    layout = "us";
    variant = "altgr-intl";
  };

  environment.shellAliases.camara = "mpv rtsp://jujodeve:SuperJoti3275@192.168.0.6/stream1 --profile=low-latency --no-audio";

  boot.loader.grub = {
    useOSProber = true;
    default = "2";
  };
}
