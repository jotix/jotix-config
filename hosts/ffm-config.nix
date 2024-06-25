# ffm-nixos configuration

{ pkgs, ... }:

{

  ### home-manager modules
  home-manager.users.jotix = {
    emacs.enable = true;
  };

  networking.hostName = "ffm-nixos";
  
  services.xserver.xkb = {
    layout = "es";
  };

  environment.shellAliases.camara = "mpv rtsp://jujodeve:SuperJoti3275@192.168.0.6/stream1 --profile=low-latency --no-audio";
  
  users.users.filofem = {
    isNormalUser = true;
    description = "FILOfem";
    extraGroups = [ "networkmanager" "libvirtd" ];
  };
  
  boot.loader.grub = {
    useOSProber = true;
    default = "2";
  };

  services = {
    printing = {
      enable = true;
      drivers = [ pkgs.brlaser pkgs.cups-zj-58 ];
    };
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
  };
}
