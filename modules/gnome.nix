### Gnome Module

{
  config,
  lib,
  pkgs,
  ...
}:

{
  options.gnome.enable = lib.mkEnableOption "Enable Gnome Desktop Environment";

  config = lib.mkIf (config.gnome.enable) {

    home-manager.users.jotix.ghostty.enable = lib.mkDefault true;
    home-manager.users.jotix.dconf-settings.enable = lib.mkDefault true;

    services.xserver.enable = true;
    services.xserver.displayManager.gdm.enable = true;
    services.xserver.desktopManager.gnome.enable = true;

    environment.systemPackages = with pkgs; [
      mutter
      gnome-tweaks
      gnomeExtensions.tiling-assistant
      gnomeExtensions.dash-to-dock
    ];

  };
}
