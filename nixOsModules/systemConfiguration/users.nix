### Users Module

{config, pkgs, lib, ...}:

{
  options.users.enable = lib.mkEnableOption "Enable Users";

  config = lib.mkIf(config.users.enable) {
    
    users = {
      users.jotix = {
        isNormalUser = true;
        description = "jotix";
        extraGroups = [ "networkmanager" "wheel" "libvirtd" ];
      };
      defaultUserShell = pkgs.bash;
    };
  };
}
