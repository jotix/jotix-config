### Gnome Module

{ config, lib, pkgs, ... }:

{
  options.gnome.enable = lib.mkEnableOption "Enable Gnome Desktop Environment";

  config = lib.mkIf(config.gnome.enable) {

    services.xserver.enable = true;
    services.xserver.displayManager.gdm.enable = true;
    services.xserver.desktopManager.gnome.enable = true;

    environment.systemPackages = with pkgs; [
      mutter
      gnome-tweaks
      gnomeExtensions.tiling-assistant
      gnomeExtensions.dash-to-dock
      gnome-extension-manager
    ];

    programs.dconf = {
      enable = true;
      profiles.jotix.databases = [
        {
          # lockAll = true; # prevents overriding
          settings = {
            "org/gnome/desktop/interface".color-scheme = "prefer-dark";
            #"org/gnome/desktop/interface".clock-show-weekday = true;
            "org.gnome.shell".enabled-extensions = [
              pkgs.gnomeExtensions.tiling-assistant.extensionUuid
              pkgs.gnomeExtensions.dash-to-dock.extensionUuid
            ];
          };
        }
      ];
    };

  };
}
