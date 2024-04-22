{ config, lib, pkgs, ... }:

{
  imports = [
    ./emacs/emacs.nix
    ./hyprland/hyprland.nix
    ./nvim/nvim.nix
    ./fish.nix
    ./helix.nix
    ./kitty.nix
    ./qutebrowser.nix
  ];

  hyprland.enable = lib.mkIf config.hyprland.enable true;
}
