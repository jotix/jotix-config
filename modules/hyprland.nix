# Hyprland Module

{ config, lib, pkgs, ... }:

{
  options.hyprland.enable = lib.mkEnableOption "Enable OPTION";
  
  config = lib.mkIf(config.hyprland.enable) {

    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
      portalPackage = pkgs.xdg-desktop-portal-hyprland;
    };

    environment.systemPackages = with pkgs; [
      hyprshot
      hyprlock
      hyprlang
      hyprkeys
      hypridle
      hyprshade
      hyprpaper
      hyprpicker
      hyprcursor
      xfce.thunar
      wl-clipboard
      qt6.qtwayland
      swayimg
      rofi-wayland
      kitty
      numix-gtk-theme
      numix-icon-theme
      numix-cursor-theme
      blueman
      wlr-randr
      waybar
    ];
    
  };
}

