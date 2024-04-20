## Bash Module

{ config, lib, pkgs, ... }:

{
  options.bash.enable = lib.mkEnableOption "Enable Bash";

  config = lib.mkIf(config.bash.enable) {    

    programs.bash = {
      enable = true;
      initExtra = "colorscript --random";
    };

  };
}

