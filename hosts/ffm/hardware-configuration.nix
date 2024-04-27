# hardware config
{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usb_storage" "usbhid" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  ### root
  fileSystems."/" = {
    device = "/dev/disk/by-label/ffm-nixos";
    fsType = "btrfs";
    options = [ "subvol=/nixos/root" ];
  };
  
  ### home
  fileSystems."/home" = {
    device = "/dev/disk/by-label/ffm-nixos";
    fsType = "btrfs";
    options = [ "subvol=/nixos/home" ];
  };

  ### home
  fileSystems."/mnt/ffm-nixos" = {
    device = "/dev/disk/by-label/ffm-nixos";
    fsType = "btrfs";
    options = [ "subvol=/" ];
  };

  ### efi
  fileSystems."/boot/efi" = {
    device = "/dev/disk/by-label/FFM-EFI";
    fsType = "vfat";
  };

  ### Ventoy
  # fileSystems."/mnt/Ventoy" = {
  #   device = "/dev/disk/by-label/Ventoy";
  #   fsType = "exfat";
  # };

  ### swap
  swapDevices = [ {
    device = "/var/lib/swapfile";
    size = 4096;
  } ];

  networking.useDHCP = lib.mkDefault true;

  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
