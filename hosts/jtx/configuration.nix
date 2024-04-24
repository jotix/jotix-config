# jtx-nixos hosts configuration

{ config, pkgs, ... }:

{
  # enable home-manager modules
  home-manager.users.jotix = {
    emacs.enable = true;
    hyprland.enable = true;
    nvim.enable = true;
    waybar.enable = true;
    kitty.enable = true;
    #qutebrowser.enable = true;
  };

  #cups.enable = true;
  #gnome.enable = true;
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
