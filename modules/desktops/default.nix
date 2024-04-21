### desktops Module

{config, pkgs, lib, ...}:

{
  imports = [
    ./plasma.nix
    ./gnome.nix
    ./wayland.nix
  ];
}
