# HomeManager Default Module

{ config, lib, pkgs, ... }:

{
  home.stateVersion = "23.11";

  imports = [
    ./editors/default.nix
    ./windowManagers/default.nix
    ./commandLineTools/default.nix
    ./guiApps/default.nix
  ];

  programs.bash = {
    enable = true;
    initExtra = "colorscript --random";
  };
  
  programs.lazygit.enable = true;
 
}
