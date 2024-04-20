## Fish Module

{ config, lib, pkgs, ... }:

{
  options.fish.enable = lib.mkEnableOption "Enable Fish";

  config = lib.mkIf(config.fish.enable) {    

    programs.fish = {
      enable = true;
      interactiveShellInit = "colorscript --random";
    };

  };
}

