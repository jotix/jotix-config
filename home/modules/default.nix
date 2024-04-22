{ config, lib, pkgs, ... }:

{
  imports = [
    ./emacs/emacs.nix
    ./hyprland/hyprland.nix
    ./nvim/nvim.nix
    ./kitty.nix
    ./qutebrowser.nix
  ];
}
