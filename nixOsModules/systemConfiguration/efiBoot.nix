### EFIboot Module

{ config, lib, pkgs, ... }:

{
  options.efiBoot.enable = lib.mkEnableOption "Enable EFI boot";

  config = lib.mkIf(config.efiBoot.enable) {
    
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
  };
}
