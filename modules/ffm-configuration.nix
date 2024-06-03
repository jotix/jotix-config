# ffm-nixos configuration

{ pkgs, ... }:

{
  networking.hostName = "ffm-nixos";
  
  services.xserver.xkb = {
    layout = "us";
    variant = "altgr-intl";
  };

  environment.shellAliases.camara = "mpv rtsp://jujodeve:SuperJoti3275@192.168.0.6/stream1 --profile=low-latency --no-audio";

  boot.loader.grub = {
    useOSProber = true;
    default = "2";
  };

  services = {
    printing = {
      enable = true;
      drivers = [ pkgs.brlaser pkgs.cups-zj-58 ];
    };
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
  };
}
