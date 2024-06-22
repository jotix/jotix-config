### Syncthing
{ pkgs, ... }:

{
  services.syncthing = {
    enable = true;
    user = "jotix";
    dataDir = "/home/jotix";
    configDir = "/home/jotix/.config/syncthing";
    overrideFolders = false;
    overrideDevices = false;
  };
}

  
