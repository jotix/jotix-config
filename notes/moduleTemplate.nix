### NAME Module

{ config, lib, pkgs, ... }:

{
  options.OPTION.enable = lib.mkEnableOption "Enable OPTION";
  
  config = lib.mkIf(config.OPTION.enable) {
    
  };
}
