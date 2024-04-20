### AndroidStudio Module

{ config, lib, pkgs, ... }:

{
  options.android-studio.enable = lib.mkEnableOption "Enable Android Studio";
  
  config = lib.mkIf(config.android-studio.enable) {

    environment.systemPackages = with pkgs; [ 
      android-studio
    ];
    
  };
}
