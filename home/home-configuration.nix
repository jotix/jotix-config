# HomeManager Default Module

{ config, lib, pkgs, ... }:

{
  home.stateVersion = "23.11";

  imports = [
    ./modules/default.nix
  ];

  programs.bash = {
    enable = true;
    initExtra = "colorscript --random";
  };

  programs.powerline-go.enable = true;

  programs.eza = {
    enable = true;
    enableBashIntegration = true;
    icons = true;
    extraOptions = [
      "--group-directories-first"
      "--header"
    ];
  };

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
 
}
