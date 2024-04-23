{ config, lib, pkgs, ... }:

{
  imports = [
    ./emacs/emacs.nix
    ./hyprland/hyprland.nix
    ./nvim/nvim.nix
    ./waybar/waybar.nix
    ./kitty.nix
    ./qutebrowser.nix
  ];
}
