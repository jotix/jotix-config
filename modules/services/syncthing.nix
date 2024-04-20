# Syncthing Module

{ config, lib, pkgs, ... }:

{
  options.syncthing.enable = lib.mkEnableOption "Enable Syncthing";

  config = lib.mkIf(config.syncthing.enable) {
    
    services.syncthing = {
      enable = true;
      user = "jotix";
      dataDir = "/home/jotix";
      configDir = "/home/jotix/.config/syncthing";
      overrideFolders = false;
      overrideDevices = false;
    };
  };
}
