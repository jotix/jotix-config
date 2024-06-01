# jtx-nixos hosts configuration

{ ... }:

{

  ### NixOS Modules
  #cups.enable = true;
  #exwm.enable = true;
  #gnome.enable = true;
  #hyprland.enable = true;
  plasma.enable = true;
  qmk.enable = true;
  #river.enable = true;
  steam.enable = true;
  #syncthing.enable = true;
    
  networking = {
    hostName = "jtx-nixos";
  };

  services.xserver.xkb = {
    layout = "us";
    variant = "altgr-intl";
  };
  
}
