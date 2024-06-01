### River WM Module

{ config, lib, pkgs, ... }:

{
  options.river.enable = lib.mkEnableOption "Enable River WM";
  
  config = lib.mkIf(config.river.enable) {

    programs.river.enable = true;
    
  };
}
