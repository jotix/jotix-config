### Gnome Desktop
{ pkgs, ... }:

{
  services.xserver = {
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  environment.systemPackages = with pkgs; [
    gnome.gnome-tweaks
    gnome.cheese
    gnomeExtensions.tiling-assistant
  ];
}

  