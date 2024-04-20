### Environment Module

{config, pkgs, lib, ...}:

{
  options.environment.enable = lib.mkEnableOption "Enable Environment";

  config = lib.mkIf(config.environment.enable) {
    environment = {
      variables = {
        EDITOR = "nvim";
        VISUAL = "nvim";
      };
      shellAliases = {
        rebuild = "sudo nixos-rebuild switch --flake .#$HOSTNAME";
        rebuild-boot = "sudo nixos-rebuild boot --flake .#$HOSTNAME";
        cdc = "cd ~/nixos-config";
      };
    };

  };
}
