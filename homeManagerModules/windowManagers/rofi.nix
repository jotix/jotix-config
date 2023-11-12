### Rofi Module

{ config, lib, pkgs, ... }:

{
  options.rofi.enable = lib.mkEnableOption "Enable Rofi";
  
  config = lib.mkIf(config.rofi.enable) {

    programs.rofi = {
      enable = true;
      package = pkgs.rofi-wayland;
      cycle = true;
      theme = "gruvbox-dark";
      font = "JetBrains Mono";
    }; 

  };
}
