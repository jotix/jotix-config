### Qutebrowser Module

{ config, lib, pkgs, ... }:

{
  programs.qutebrowser = {
    enable = true;
    quickmarks = {
      youtube = "https://youtube.com";
      nixos = "https://nixos.org";
      hsbc = "https://www.onlinebanking.hsbc.com.ar/login";
      gmail = "https://mail.google.com/mail/u/0/#inbox";
      lanacion = "https://lanacion.com.ar";
    };
  };
}
