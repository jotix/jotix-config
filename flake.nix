
{
  description = "jotix NixOS configurations";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
  };

  outputs = inputs@{ nixpkgs, ... }: {
    nixosConfigurations = {

      jtx-nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./modules/default.nix
          ./modules/hardware-config.nix
          ./modules/jtx-config.nix
        ];
      };

      ffm-nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./modules/default.nix
          ./modules/hardware-config.nix
          ./modules/ffm-config.nix
        ];
      };

    };
  };
}
