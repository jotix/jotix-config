### Zoxide Module

{ config, lib, pkgs, ... }:

{
  options.zoxide.enable = lib.mkEnableOption "Enable Zoxide";
  
  config = lib.mkIf(config.zoxide.enable) {    
    programs.zoxide = {
      enable = true;
      enableBashIntegration = true;
    };
  };
}
