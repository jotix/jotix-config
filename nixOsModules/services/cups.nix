{ config, lib, pkgs, ... }:

{
  options.cups.enable = lib.mkEnableOption "Enable Cups";

  config = lib.mkIf(config.cups.enable) {
    services = {
      printing = {
        enable = true;
        drivers = [ pkgs.brlaser pkgs.cups-zj-58 ];
      };
      avahi = {
        enable = true;
        nssmdns4 = true;
        openFirewall = true;
      };
    };
  };
}
