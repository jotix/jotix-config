{ config, lib, pkgs, ... }:

{
  imports = [
    ./cups.nix
    ./gnome.nix
    ./plasma.nix
    ./qmk.nix
    ./steam.nix
  ];
}

