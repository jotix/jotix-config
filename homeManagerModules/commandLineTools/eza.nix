### Eza Module

{ config, lib, pkgs, ... }:

{
  options.eza.enable = lib.mkEnableOption "Enable Eza";
  
  config = lib.mkIf(config.eza.enable) {    
    programs.eza = {
      enable = true;
      enableBashIntegration = true;
      icons = true;
      extraOptions = [
        "--group-directories-first"
        "--header"
      ];
    };
  };
}
