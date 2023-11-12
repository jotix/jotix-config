{ config, lib, pkgs, ... }:

{
  imports = [
    ./guile.nix
    ./python.nix
    ./rust.nix
  ];

  guile.enable = lib.mkDefault true;
}
