{ lib, osConfig, ... }:

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
  # emacs.enable = lib.mkDefault true;
  openttd.enable = lib.mkDefault true;
  # neovim.enable = lib.mkDefault true;
  zed.enable = lib.mkDefault true;

  ### DE conditionals
  dconf.enable = lib.mkIf osConfig.gnome.enable true;
  ghostty.enable = lib.mkIf osConfig.gnome.enable true;
  kitty.enable = lib.mkIf osConfig.plasma.enable true;

}
