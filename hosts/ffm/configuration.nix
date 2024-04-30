# ffm-nixos configuration

{ config, pkgs, lib, ... }:

{

  ### home-manager modules
  home-manager.users.jotix = {
    #emacs.enable = true;
    #hyprland.enable = true;
    #nvim.enable = true;
    #waybar.enable = true;
    helix.enable = true;
    kitty.enable = true;
    #qutebrowser.enable = true;
  };

  ### NixOS Modules
  cups.enable = true;
  #gnome.enable = true;
  #hyprland.enable = true;
  plasma.enable = true;
  qmk.enable = true;
  steam.enable = true;

  ### Host specific config
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

  boot.loader.grub.default = "2";
}
