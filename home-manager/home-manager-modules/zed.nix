### zed Module

{ config, lib, pkgs, ... }:

{
  options.zed.enable = lib.mkEnableOption "Enable zed editor";
  
  config = lib.mkIf(config.zed.enable) {

    programs.zed-editor = {
      enable = true;
      extensions = [
        "nix"
      ];
      userSettings = {
          ui_font_size = 16;
          buffer_font_size = 14;
          theme = {
            mode = "system";
            light = "One Light";
            dark = "One Dark";
          };
          buffer_font_family = "Source Code Pro";
          terminal = {
            font_family = "Source Code Pro";
            line_height = "standard";
          };
        };
    };

  };
}
