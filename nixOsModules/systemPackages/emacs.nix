{ config, lib, pkgs, ... }:

{
  options.emacs.enable = lib.mkEnableOption "Enable Emacs";

  config = lib.mkIf(config.emacs.enable) {

    services.emacs.enable = true;

  };
}
