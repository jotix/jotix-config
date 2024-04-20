# jtx-nixos hosts configuration

{ config, ... }:

{
  #home-manager.users.jotix = { 
  #  hyprland.enable = true;
  #  qutebrowser.enable = true;
  #};

  plasma.enable = true;
  qmk.enable = true;
  steam.enable = true;
  #android-studio.enable = true;
  
  networking = {
    hostName = "jtx-nixos";
  };

  services.xserver.xkb = {
    layout = "us";
    variant = "altgr-intl";
  };

}
