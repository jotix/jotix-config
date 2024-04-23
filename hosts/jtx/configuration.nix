# jtx-nixos hosts configuration

{ config, pkgs, ... }:

{
  hyprland.enable = true;
  #plasma.enable = true;
  qmk.enable = true;
  steam.enable = true;
  
  networking = {
    hostName = "jtx-nixos";
  };

  services.xserver.xkb = {
    layout = "us";
    variant = "altgr-intl";
  };
  
}
