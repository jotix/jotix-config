### Networking Module

{config, pkgs, lib, ...}:

{
  options.networking.enable = lib.mkEnableOption "Enable Networking";

  config = lib.mkIf(config.efiBoot.enable) {
    networking = {
      networkmanager.enable = true;
      nameservers = [ "8.8.8.8" "8.8.4.4" ];
    };
  };
}
