{ lib, ... }:

{
  
  imports = [
    ./emacs/emacs.nix
    ./kate/kate.nix
    ./neovim/neovim.nix
    ./openttd/openttd.nix
    ./dconf-settings.nix
    ./helix.nix
    ./kitty.nix
  ];

  ### default enable modules
  emacs.enable = lib.mkDefault true;
  openttd.enable = lib.mkDefault true;
  neovim.enable = lib.mkDefault true;
  dconf-settings.enable = lib.mkDefault true;
  
}
