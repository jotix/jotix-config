# ffm-nixos configuration

{ pkgs, ... }:

{

  cups.enable = true;
  
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

}
