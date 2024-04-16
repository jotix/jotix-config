{ config, lib, pkgs, ... }:

{
  imports = [
    ./sbcl.nix
    ./guile.nix
    ./python.nix
    ./rust.nix
  ];

  guile.enable = lib.mkDefault true;
  python.enable = lib.mkDefault true;
  sbcl.enable = lib.mkDefault true;
}
