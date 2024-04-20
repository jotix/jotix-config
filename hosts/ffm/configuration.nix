# ffm-nixos configuration

{ config, pkgs, lib, ... }:

{
  home-manager.users.jotix = { 
    emacs.enable = true;
  };

  steam.enable = true;
  qmk.enable = true;
  plasma.enable = true;
  cups.enable = true;

  networking.hostName = "ffm-nixos";
  
  users.users.filofem = {
    isNormalUser = true;
    description = "FILOfem";
    extraGroups = [ "networkmanager" "libvirtd" ];
  };

  services.xserver.xkb = {
    layout = "es";
    #variant = "";
  };

  environment.shellAliases.camara = "mpv rtsp://jujodeve:SuperJoti3275@192.168.0.6/stream1 --profile=low-latency --no-audio";

}
