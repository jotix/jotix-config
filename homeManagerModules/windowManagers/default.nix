### WindowsManagers default Module

{ config, lib, pkgs, ... }:

{
  
  imports = [
    ./hyprland/hyprland.nix
    ./waybar/waybar.nix
    ./wofi/wofi.nix
    ./gtkConfig.nix
    ./rofi.nix
  ];

  #hyprland.enable = lib.mkDefault false;
  waybar.enable = lib.mkIf config.hyprland.enable true;
  wofi.enable = lib.mkIf config.hyprland.enable true;
  gtkConfig.enable = lib.mkIf config.hyprland.enable true;
  rofi.enable = lib.mkIf config.hyprland.enable true;
  
}
