### Gui Apps Default Module

{ config, lib, pkgs, ... }:

{
  imports = [
    ./kitty.nix
    ./qutebrowser.nix
  ];

  kitty.enable = lib.mkDefault true;
  
}
