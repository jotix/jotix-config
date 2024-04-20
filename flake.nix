
{
  description = "jotix NixOS configurations";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    # home-manager.url = "github:nix-community/home-manager";
    # home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  # outputs = inputs@{ nixpkgs, home-manager, ... }: {
  outputs = inputs@{ nixpkgs, ... }: {
    nixosConfigurations = {

      jtx-nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/jtx/configuration.nix
          ./hosts/jtx/hardware-configuration.nix
          ./modules/default.nix
          # home-manager.nixosModules.home-manager {
          #   home-manager.useGlobalPkgs = true;
          #   home-manager.useUserPackages = true;
          #   home-manager.users.jotix = import ./homeManagerModules/default.nix;
          #}
        ];
      };

      ffm-nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/ffm/configuration.nix
          ./hosts/ffm/hardware-configuration.nix
          ./modules/default.nix
          # home-manager.nixosModules.home-manager {
          #   home-manager.useGlobalPkgs = true;
          #   home-manager.useUserPackages = true;
          #   home-manager.users.jotix = import ./homeManagerModules/default.nix;
          # }
        ];
      };

    };
  };
}
