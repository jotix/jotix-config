# HomeManager Default Module

{ lib, ... }:

{
  home-manager.users.jotix = {

    imports = [
      ./home-manager-modules/default.nix
    ];

    emacs.enable = lib.mkDefault true;
    openttd.enable = lib.mkDefault true;

    home.stateVersion = "24.05";

    programs.bash = {
      enable = true;
      initExtra = ''fastfetch'';
    };

    programs.eza = {
      enable = true;
      enableBashIntegration = true;
      icons = "auto";
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

    programs.powerline-go.enable = true;

    programs.zoxide.enable = true;

  };
}

