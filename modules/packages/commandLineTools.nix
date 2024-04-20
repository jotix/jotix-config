### commandLineTools Module

{ config, pkgs, lib, ... }:

{
  options.commandLineTools.enable = lib.mkEnableOption "Enable CommandLineTools";

  config = lib.mkIf(config.commandLineTools.enable) {

    environment.systemPackages = with pkgs; [
      zip
      unzip
      p7zip
      killall
      wget
      neofetch
      dwt1-shell-color-scripts
      wlr-randr
      mpv
      htop
      fuse
      wl-clipboard
      xclip
      eza
      git
      lazygit
      powerline-go
      neovim
    ];

  };
}

