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
    device = "/dev/disk/by-label/jtx-system";
    fsType = "btrfs";
    options = [ "subvol=/nixos/root" ];
  };

  ### home
  fileSystems."/home" = {
    device = "/dev/disk/by-label/jtx-system";
    fsType = "btrfs";
    options = [ "subvol=/nixos/home" ];
  };

  ### efi
  fileSystems."/boot/efi" = {
    device = "/dev/disk/by-label/JTX-EFI";
    fsType = "vfat";
  };
  
  ### jtx-system
  fileSystems."/mnt/jtx-system" = {
    device = "/dev/disk/by-label/jtx-system";
    fsType = "btrfs";
    options = [ "subvol=/" ];
  };

  ### jtx-ssd
  fileSystems."/mnt/jtx-ssd" = {
    device = "/dev/disk/by-label/jtx-ssd";
    fsType = "btrfs";
    options = [ "subvol=/" ];
  };

  ### jtx-nvme
  fileSystems."/mnt/jtx-nvme" = {
    device = "/dev/disk/by-label/jtx-nvme";
    fsType = "btrfs";
    options = [ "subvol=/" ];
  };

  ### Ventoy
  fileSystems."/mnt/Ventoy" = {
    device = "/dev/disk/by-label/Ventoy";
    fsType = "exfat";
  };

  ### swap
  swapDevices = [ {
    device = "/var/lib/swapfile";
    size = 4096;
  } ];

  networking.useDHCP = lib.mkDefault true;

  hardware = {
    cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    keyboard.qmk.enable = true;
    bluetooth.enable = true;
  };

}
