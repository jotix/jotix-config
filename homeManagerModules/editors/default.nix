{ config, lib, pkgs, ... }:

{

  imports = [
    ./emacs/emacs.nix
    ./neovim/neovim.nix
    ./helix.nix
  ];

  neovim.enable = lib.mkDefault true;
}
