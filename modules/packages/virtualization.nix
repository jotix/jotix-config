{ config, lib, pkgs, ... }:

{
  options.virtualization.enable = lib.mkEnableOption "Enable virtualization";

  config = lib.mkIf(config.virtualization.enable) {
    virtualisation = {
      libvirtd = { 
        enable = true; 
        qemu = {
          ovmf = {
            enable = true;
            packages = [ pkgs.OVMFFull.fd ];
          };
          swtpm.enable = true;
        };
      };
      spiceUSBRedirection.enable = true;
    };
    programs.virt-manager = {
      enable = true;
      package = pkgs.virt-manager;
    };
    #virtualisation.tpm.enable = true;
    environment.systemPackages = with pkgs; [ virtiofsd ];
  };
}
