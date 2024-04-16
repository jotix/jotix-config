### SBCL Module

{ config, lib, pkgs, ... }:

{
  options.sbcl.enable = lib.mkEnableOption "Enable Steel Bank Common LISP";
  
  config = lib.mkIf(config.sbcl.enable) {

    environment.systemPackages = with pkgs; [
      sbcl
      sbclPackages.sqlite
      sbclPackages.cl-pdf
    ];
    
  };
}

