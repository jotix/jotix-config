### Command Line Tools Default Module

{ config, lib, pkgs, ... }:

{
  imports = [
    ./bash.nix
    ./eza.nix
    ./fish.nix
    ./git.nix
    ./zoxide.nix
  ];

  bash.enable = lib.mkDefault true;
  eza.enable = lib.mkDefault true;
  git.enable = lib.mkDefault true;
  zoxide.enable = lib.mkDefault true;

  programs.powerline-go.enable = true;
}
