### desktops Module

{config, pkgs, lib, ...}:

{
  imports = [
    ./hyprland.nix
    ./plasma.nix
    ./gnome.nix
  ];
}
