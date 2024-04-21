# Hyprland Module

{ config, lib, pkgs, ... }:

{
  options.hyprland.enable = lib.mkEnableOption "Enable Hyprland";

  config = lib.mkIf(config.hyprland.enable) {

    environment.systemPackages = with pkgs; [
      hyprland
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
      xdg-desktop-portal-hyprland
      xdg-desktop-portal-gtk
      waybar
      kitty
      numix-gtk-theme
      numix-icon-theme
      numix-cursor-theme
    ];
    
  };
}
