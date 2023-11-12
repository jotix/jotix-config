# Plasma Module

{ config, pkgs, lib, ... }:

{
  options.plasma.enable = lib.mkEnableOption "Enable Plasma";

  config = lib.mkIf(config.plasma.enable) {
    # Enable the X11 windowing system.
    services.xserver = {
      enable = true;

    };
    
    services.displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      autoNumlock = true;
    };
    
    services.desktopManager.plasma6.enable = true;

    environment.systemPackages = with pkgs; [
      digikam
      kdePackages.kate
      kdePackages.kcalc
      libsForQt5.kamoso
      #kdePackages.kamoso
    ];
  }; 
}
