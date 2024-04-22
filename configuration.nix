# default configuration

{ config, pkgs, lib, ... }:

{
  imports = [
    ./modules/desktops/default.nix
    ./modules/packages/default.nix
    ./modules/services/default.nix
  ];
  
  nix = {
    package = pkgs.nixFlakes; # or versioned attributes like nixVersions.nix_2_8
    extraOptions = ''experimental-features = nix-command flakes'';
  };

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "23.11";

  ### boot #####################################################################
  boot = {
    # kernel version
    kernelPackages = pkgs.linuxKernel.packages.linux_6_8;

    supportedFilesystems = [ "ntfs" ];
    
    loader = {
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
      };
      grub = {
        enable = true;
        efiSupport = true;
        device = "nodev";
        #useOSProber = true;
      };
    };
  };

  ### networking ###############################################################
  networking = {
    networkmanager.enable = true;
    nameservers = [ "8.8.8.8" "8.8.4.4" ];
  };

  ### environment ##############################################################
  environment = {
    variables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };
    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake .#$HOSTNAME";
      rebuild-boot = "sudo nixos-rebuild boot --flake .#$HOSTNAME";
      cdc = "cd ~/nixos-config";
    };
  };

  ### locale #################################################################
  time.timeZone = "America/Argentina/Buenos_Aires";
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

  ### users ####################################################################
  users = {
    users.jotix = {
      isNormalUser = true;
      description = "jotix";
      extraGroups = [ "networkmanager" "wheel" "libvirtd" ];
    };
    defaultUserShell = pkgs.bash;
  };

  security.pam.services.swaylock = {};

}
