# HomeManager Default Module

{ ... }:

{
  home-manager.users.jotix = {

    imports = [
      ./home-manager-modules/default.nix
    ];

    home.stateVersion = "24.11";

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

    programs.zed-editor = {
      enable = true;
      extensions = [
        "nix"
      ];
      userSettings = {
          ui_font_size = 16;
          buffer_font_size = 14;
          theme = {
            mode = "system";
            light = "One Light";
            dark = "One Dark";
          };
          buffer_font_family = "Source Code Pro";
          terminal = {
            font_family = "Source Code Pro";
            line_height = "standard";
          };
        };
    };

    programs.lazygit.enable = true;

    programs.powerline-go.enable = true;

    programs.zoxide.enable = true;

  };
}
