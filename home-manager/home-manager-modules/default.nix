{ lib, ... }:

{

  imports = [
    ./emacs/emacs.nix
    ./dconf-settings.nix
    ./ghostty.nix
    ./helix.nix
    ./kitty.nix
    ./neovim.nix
    ./openttd.nix
    ./zed.nix
  ];

  ### default enable modules
  emacs.enable = lib.mkDefault true;
  openttd.enable = lib.mkDefault true;
  # neovim.enable = lib.mkDefault true;
  dconf-settings.enable = lib.mkDefault true;
  ghostty.enable = true;
  zed.enable = lib.mkDefault true;

}
