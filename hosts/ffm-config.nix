# ffm-nixos configuration

{ pkgs, ... }:

{

  networking.hostName = "ffm-nixos";  

  environment.shellAliases.camara = "mpv rtsp://jujodeve:SuperJoti3275@192.168.0.6/stream1 --profile=low-latency --no-audio";
  
  users.users.filofem = {
    isNormalUser = true;
    description = "FILOfem";
    extraGroups = [ "networkmanager" "libvirtd" ];
  };
  
  boot.loader.grub = {
    useOSProber = true;
    default = "2";
  };

  services = {
    printing = {
      enable = true;
      drivers = [
        pkgs.brlaser
        pkgs.cups-zj-58
        pkgs.epson-escpr
        pkgs.cups-filters
        (pkgs.callPackage ../modules/hprt-tp806l/hprt-tp806l.nix {})
      ];
    };
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
  };
}
