### Fonts Module

{ config, lib, pkgs, ... }:

{
  options.fonts.enable = lib.mkEnableOption "Enable Fonts";
  
  config = lib.mkIf(config.fonts.enable) {

    fonts.packages = with pkgs; [
      google-fonts
      nerdfonts
      roboto
      roboto-mono
      jetbrains-mono
      fira-code
      fira-code-nerdfont
      powerline-fonts
    ];
    
  };
}



