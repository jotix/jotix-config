### Rust Module

{ config, lib, pkgs, ... }:

{
  options.rust.enable = lib.mkEnableOption "Enable Rust";
  
  config = lib.mkIf(config.rust.enable) {

    environment.systemPackages = with pkgs; [
      rustc
      cargo
    ];
    
  };
}
