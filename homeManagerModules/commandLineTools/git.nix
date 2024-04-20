### Git Module

{ config, lib, pkgs, ... }:

{
  options.git.enable = lib.mkEnableOption "Enable Git";
  
  config = lib.mkIf(config.git.enable) {

    programs.git = {
      enable = true;
      userName = "jotix";
      userEmail = "jujodeve@gmail.com";
      ignores = [
        "*~"
        "*.swp"
        "*~undo-tree~"
        "#*"
      ];
      extraConfig = {
        init = {
          defaultBranch = "main";
        };
      };
    };

    programs.lazygit.enable = true;

  };
}
