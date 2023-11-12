# default configuration

{ config, pkgs, lib, ... }:

{
  imports = [
    ./desktops/default.nix
    ./languages/default.nix
    ./services/default.nix
    ./systemConfiguration/default.nix
    ./systemPackages/default.nix
  ];  

  nix = {
    package = pkgs.nixFlakes; # or versioned attributes like nixVersions.nix_2_8
    extraOptions = ''experimental-features = nix-command flakes'';
  };
  
  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "23.11";

  ### xz backdoor mitigation for server only
  #system.replaceRuntimeDependencies = [
  #  original = pkgs.xz;
  #  replacementt = pkgs-staging-next.xz;
  #];

  security.pam.services.swaylock = {};
  
  home-manager.backupFileExtension = "backup";

}
