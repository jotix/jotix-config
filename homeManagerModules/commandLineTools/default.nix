### Command Line Tools Default Module

{ config, lib, pkgs, ... }:

{
  imports = [
    ./eza.nix
    ./git.nix
    ./zoxide.nix
  ];

  eza.enable = lib.mkDefault true;
  git.enable = lib.mkDefault true;
  zoxide.enable = lib.mkDefault true;

  programs.powerline-go.enable = true;
}
