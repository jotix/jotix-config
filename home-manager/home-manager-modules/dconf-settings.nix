### dconf-settiongs Module

{
  config,
  lib,
  pkgs,
  ...
}:

{
  options.dconf-settings.enable = lib.mkEnableOption "Enable dconf-settings";

  config = lib.mkIf (config.dconf-settings.enable) {
    dconf = {
      enable = true;
      settings = {
        "org/gnome/shell" = {
          disable-user-extensions = false; # enables user extensions
          enabled-extensions = [
            # Put UUIDs of extensions that you want to enable here.
            # If the extension you want to enable is packaged in nixpkgs,
            # you can easily get its UUID by accessing its extensionUuid
            # field (look at the following example).
            pkgs.gnomeExtensions.tiling-assistant.extensionUuid
            pkgs.gnomeExtensions.dash-to-dock.extensionUuid

            # Alternatively, you can manually pass UUID as a string.
            # "blur-my-shell@aunetx"
            # ...
          ];
        };

        "org/gnome/nautilus/icon-view".default-zoom-level = "small";
        "org/gnome/settings-daemon/plugins/power".sleep-inactive-ac-type = "nothing";
        "org/gnome/desktop/interface".color-scheme = "prefer-dark";
        "org/gnome/desktop/session".idle-delay = lib.hm.gvariant.mkUint32 480;
        "org/gnome/desktop/screensaver".lock-enabled = false;
        "org/gnome/desktop/notifications".show-banners = false;
        "org/gnome/desktop/wm/preferences".button-layout = "appmenu:minimize,maximize,close";
        "org/gnome/Console".last-window-size = lib.hm.gvariant.mkTuple [
          1200
          900
        ];
        "org/gnome/shell".favorite-apps = [
          "firefox.desktop"
          "org.gnome.Nautilus.desktop"
          #"firefox.desktop"
          "org.gnome.Extensions.desktop"
          "dev.zed.Zed.desktop"
          "com.mitchellh.ghostty.desktop"
          #"emacs.desktop"
          "steam.desktop"
          #"org.gnome.Console.desktop"
          "org.gnome.Calculator.desktop"
          "org.gnome.tweaks.desktop"
          "chrome-knipfmibhjlpioflafbpemngnoncknab-Default.desktop"
        ];

      };
    };
  };
}
