# Gnome Module

{ config, pkgs, lib, ... }:

{
  options.gnome.enable = lib.mkEnableOption "Enable Gnome";

  config = lib.mkIf(config.gnome.enable) {
    # Enable the X11 windowing system.
    services.xserver = {
      enable = true;
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
    };

    environment.systemPackages = with pkgs; [
      gnome.gnome-tweaks
      gnome.cheese
    ];
  }; 
}
