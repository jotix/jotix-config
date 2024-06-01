
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
          ./hosts/jtx/configuration.nix
          ./hosts/jtx/hardware-configuration.nix
          ./modules/default.nix
        ];
      };

      ffm-nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/ffm/configuration.nix
          ./hosts/ffm/hardware-configuration.nix
          ./modules/default.nix
        ];
      };

    };
  };
}
