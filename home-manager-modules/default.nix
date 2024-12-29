{ lib, ... }:

{
  
  imports = [
    ./emacs/emacs.nix
    ./dconf-settings.nix
    ./helix.nix
    ./kate.nix
    ./kitty.nix
    ./neovim.nix
    ./openttd.nix
  ];

  ### default enable modules
  emacs.enable = lib.mkDefault true;
  openttd.enable = lib.mkDefault true;
  neovim.enable = lib.mkDefault true;
  dconf-settings.enable = lib.mkDefault true;
  
}
