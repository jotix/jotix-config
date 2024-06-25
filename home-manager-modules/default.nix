# HomeManager Default Module

{ ... }:

{
  home.stateVersion = "24.05";

  imports = [
    ./emacs/emacs.nix
  ];

  programs.bash = {
    enable = true;
    initExtra = "fastfetch";
  };

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

  programs.kitty = {
    enable = true;
    font = {
      name = "Jetbrains Mono";
      size = 10;
    };
    settings = {
      background_opacity = "0.9";
    };
    keybindings = {
      "ctrl+." = "change_font_size all +2.0";
      "ctrl+," = "change_font_size all -2.0";
      "ctrl+t" = "new_tab_with_cwd";
      "ctrl+left" = "next_tab";
      "ctrl+right" = "previous_tab";
      "ctrl+w" = "close_tab";
    };
  };

  programs.helix = {
    enable = true;
    settings = {
      theme = "tokyonight_storm";
      editor.line-number = "relative";
      keys.normal.esc = ["collapse_selection" "keep_primary_selection"];
    };
    defaultEditor = true;
  };

  home.shellAliases = {
    vi = "hx";
    vim = "hx";
    nvim = "hx";
  };

  programs.lazygit.enable = true;

  programs.powerline-go.enable = true;

  programs.zoxide.enable = true;
 
}

