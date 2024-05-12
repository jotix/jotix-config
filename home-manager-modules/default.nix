# HomeManager Default Module

{ ... }:

{
  home.stateVersion = "23.11";

  imports = [
    ./emacs/emacs.nix
    ./hyprland/hyprland.nix
    ./nvim/nvim.nix
    ./waybar/waybar.nix
    ./helix.nix
    ./kitty.nix
    ./qutebrowser.nix
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

  programs.lazygit.enable = true;
  programs.powerline-go.enable = true;
 
}
