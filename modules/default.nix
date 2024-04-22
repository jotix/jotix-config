{ config, lib, pkgs, ... }:

{
  imports = [
    ./cups.nix
    ./gnome.nix
    ./hyprland.nix
    ./plasma.nix
    ./qmk.nix
    ./steam.nix
  ];
}

