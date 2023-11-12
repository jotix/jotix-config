### Locales Modules

{ config, lib, ... }:

{
  options.locales.enable = lib.mkEnableOption "Enable Locales";

  config = lib.mkIf(config.locales.enable) {
    # Set your time zone.
    time.timeZone = "America/Argentina/Buenos_Aires";

    # Select internationalisation properties.
    i18n.defaultLocale = "en_US.UTF-8";

    i18n.supportedLocales = [
      "en_US.UTF-8/UTF-8"
      "es_AR.UTF-8/UTF-8"
    ];

    i18n.extraLocaleSettings = {
      LANG     = "en_US.UTF-8";
      LANGUAGE = "en_US.UTF-8";
      LC_ALL   = "es_AR.UTF-8";
    };
  };
}
