### Guile Module

{ config, lib, pkgs, ... }:

{
  options.guile.enable = lib.mkEnableOption "Enable Guile";
  
  config = lib.mkIf(config.guile.enable) {

    environment.systemPackages = with pkgs; [
      guile
      guile-ncurses
      guile-sqlite3
    ];
    
  };
}

