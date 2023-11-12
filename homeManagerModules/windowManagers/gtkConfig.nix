### GTK Config Module

{ config, lib, pkgs, ... }:

{
  options.gtkConfig.enable = lib.mkEnableOption "Enable GTK config";
  
  config = lib.mkIf(config.gtkConfig.enable) {

    gtk = {
      enable = true;
      cursorTheme = {
        package = pkgs.numix-cursor-theme;
        name = "Numix";
      };
      font = {
        package = pkgs.ubuntu_font_family;
        name = "Ubuntu Condensed";
        size = 10;
      };
      iconTheme = {
        package = pkgs.numix-icon-theme;
        name = "Numix";
      };
      theme = {
        package = pkgs.numix-gtk-theme;
        name = "Numix";
      };
    };
  };
}
