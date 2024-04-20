{ config, lib, pkgs, ... }:

{
  imports = [
    ./android-studio.nix
    ./commandLineTools.nix
    ./emacs.nix
    ./fonts.nix
    ./guiApps.nix
    ./qmk.nix
    ./steam.nix
    ./virtualization.nix
  ];

  commandLineTools.enable = lib.mkDefault true;
  emacs.enable = lib.mkDefault true;
  fonts.enable = lib.mkDefault true;
  guiApps.enable = lib.mkDefault true;
  virtualization.enable = lib.mkDefault true;
  
  environment.systemPackages = with pkgs; [
    exfat
    exfatprogs
    usbutils
    pciutils
    gnumake
    cmake
    gcc
    nixd
  ];

  programs = {
    mtr.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
      #pinentryPackage = pkgs.pinentry-curses;
    };
    fuse.userAllowOther = true;
    dconf.enable = true;
  };
}

