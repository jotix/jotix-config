### GUI Apps Module

{ config, pkgs, lib, ... }:

{
  options.guiApps.enable = lib.mkEnableOption "Enable GUI Apps";

  config = lib.mkIf(config.guiApps.enable) {

    environment.systemPackages = with pkgs; [
      librecad
      libreoffice
      gparted
      spotify      
      gimp
      firefox
      vscode
    ];
  };
}
