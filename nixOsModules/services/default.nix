### Services Module

{config, pkgs, lib, ...}:

{
  imports = [
    ./cups.nix
    ./pipewire.nix
    ./syncthing.nix
    ./udevRules.nix
  ];

  pipewire.enable = lib.mkDefault true;
  syncthing.enable = lib.mkDefault true;
 
    services = {
      #openssh.enable = true;
      openssh.enable = lib.mkForce false; ### xz backdoor mitigation
      fstrim.enable = true;
    };
 
}
