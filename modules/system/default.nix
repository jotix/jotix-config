### System Configutarion Default Module

{ config, lib, pkgs, ... }:

{
  imports = [
    ./efiBoot.nix
    ./environment.nix
    ./locales.nix
    ./networking.nix
    ./users.nix
  ];

  efiBoot.enable = lib.mkDefault true;
  environment.enable = lib.mkDefault true;
  locales.enable = lib.mkDefault true;
  networking.enable = lib.mkDefault true;
  users.enable = lib.mkDefault true;
  
}
