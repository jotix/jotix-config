### OpenTTD Module

{ config, lib, pkgs, ... }:

{
  options.openttd.enable = lib.mkEnableOption "Enable Open Transport Tycoon Deluxe";
  
  config = lib.mkIf(config.openttd.enable) {

    home.packages = with pkgs; [
      openttd
    ];
    
    xdg.configFile = {
      "openttd/openttd.cfg" = {
        enable = true;
        source = ./openttd.cfg;
      };
    };

  };
}
