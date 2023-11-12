### Python Module

{ config, lib, pkgs, ... }:

{
  options.python.enable = lib.mkEnableOption "Enable Python";
  
  config = lib.mkIf(config.python.enable) {

    environment.systemPackages = with pkgs; [
      python312Full
    ];
    
  };
}
