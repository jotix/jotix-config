### Kate Module

{ config, lib, pkgs, ... }:

{
  options.kate.enable = lib.mkEnableOption "Enable Kate";

  config = lib.mkIf(config.kate.enable) {

    xdg.configFile = {
      "katerc" = {
        enable = true;
        source = ./katerc;
      };
    };
  };
}
