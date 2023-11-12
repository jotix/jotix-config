# hardware config
{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usb_storage" "usbhid" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" = {
    device = "/dev/disk/by-label/jtx-system";
    fsType = "btrfs";
    options = [ "subvol=nixos/root" ];
  };

  fileSystems."/home" = {
    device = "/dev/disk/by-label/jtx-system";
    fsType = "btrfs";
    options = [ "subvol=nixos/home" ];
  };

  fileSystems."/boot/efi" = {
    device = "/dev/disk/by-label/JTX-EFI";
    fsType = "vfat";
  };

  fileSystems."/mnt/jtx-system" = {
    device = "/dev/disk/by-label/jtx-system";
    fsType = "btrfs";
    options = [ "subvol=/" ];
  };

  fileSystems."/mnt/Ventoy" = {
    device = "/dev/disk/by-label/Ventoy";
    fsType = "exfat";
  };

  swapDevices = [ {
    device = "/var/lib/swapfile";
    size = 4096;
  } ];

  networking.useDHCP = lib.mkDefault true;

  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
