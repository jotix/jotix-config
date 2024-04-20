# HomeManager Default Module

{ config, lib, pkgs, ... }:

{
  home.stateVersion = "23.11";

  imports = [
  editors  ./editors/default.nix
    ./windowManagers/default.nix
    ./commandLineTools/default.nix
    ./guiApps/default.nix
  ];


  
  programs.lazygit.enable = true;
 
}
