### QMK Module

{ config, lib, pkgs, ... }:

{
  options.qmk.enable = lib.mkEnableOption "Enable QMK";
  
  config = lib.mkIf(config.qmk.enable) {

    hardware.keyboard.qmk.enable = true;

    environment.systemPackages = with pkgs; [
      qmk
      qmk-udev-rules
      vial
    ];
    
  };
}
