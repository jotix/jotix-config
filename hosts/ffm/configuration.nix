# ffm-nixos configuration

{ ... }:

{

  ### home-manager modules
  home-manager.users.jotix = {
    #emacs.enable = true;
    #hyprland.enable = true;
    nvim.enable = true;
    #waybar.enable = true;
    #helix.enable = true;
    kitty.enable = true;
    #qutebrowser.enable = true;
  };

  ### NixOS Modules
  cups.enable = true;
  #gnome.enable = true;
  plasma.enable = true;
  #qmk.enable = true;
  steam.enable = true;

  ### Host specific config
  networking.hostName = "ffm-nixos";
  
  # users.users.filofem = {
  #   isNormalUser = true;
  #   description = "FILOfem";
  #   extraGroups = [ "networkmanager" "libvirtd" ];
  # };
  
  services.xserver.xkb = {
    layout = "us";
    variant = "altgr-intl";
  };

  environment.shellAliases.camara = "mpv rtsp://jujodeve:SuperJoti3275@192.168.0.6/stream1 --profile=low-latency --no-audio";

  boot.loader.grub = {
    useOSProber = true;
    default = "2";
  };
}
