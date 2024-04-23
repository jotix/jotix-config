# helix

{ config, lib, pkgs, ... }:

{
  options.helix.enable = lib.mkEnableOption "Enable Helix";

  config = lib.mkIf(config.helix.enable) {
    programs.helix = {
      enable = true;
      settings = {
        theme = "tokyonight_storm";
        editor.line-number = "relative";
        keys.normal.esc = ["collapse_selection" "keep_primary_selection"];
      };
      defaultEditor = true;
    };
  };
}
