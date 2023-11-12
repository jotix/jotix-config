### Wofi Module

{ config, lib, pkgs, ... }: 
 
let
  wofiConf = builtins.readFile( ./style.css );
in
{
  options.wofi.enable = lib.mkEnableOption "Enable wofi";

  config = lib.mkIf(config.wofi.enable) {
    programs.wofi = {
      enable = true;
      style = wofiConf;
    };
  };
}
