### google-chrome Module

{
  config,
  lib,
  pkgs,
  ...
}:

{
  options.google-chrome.enable = lib.mkEnableOption "Enable Google Chrome";

  config = lib.mkIf (config.google-chrome.enable) {

    nixpkgs.overlays = [
      (final: prev: {
        google-chrome = prev.google-chrome.override {
          commandLineArgs = "--password-store=gnome";
        };
      })
    ];

    environment.systemPackages = with pkgs; [
      google-chrome
      gnome-keyring
    ];

  };
}
