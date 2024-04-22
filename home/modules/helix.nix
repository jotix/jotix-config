# helix

{ config, lib, pkgs, ... }:

{
  programs.helix = {
    enable = true;
    settings = {
      theme = "tokyonight_storm";
      editor.line-number = "relative";
      keys.normal.esc = ["collapse_selection" "keep_primary_selection"];
    };
    defaultEditor = true;
  };
}
