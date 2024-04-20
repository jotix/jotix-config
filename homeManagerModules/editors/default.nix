{ config, lib, pkgs, ... }:

{

  imports = [
    ./emacs/emacs.nix
    ./neovim/neovim.nix
    ./helix.nix
  ];
  emacs.enable = lib.mkDefault true;
  neovim.enable = lib.mkDefault true;
}
