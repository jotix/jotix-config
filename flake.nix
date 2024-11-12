
{
  description = "jotix NixOS configurations";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ nixpkgs, home-manager, ... }: {
    nixosConfigurations = {

      jtx-nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/jtx-config.nix
          ./modules/default.nix
          #home-manager.nixosModules.home-manager {
          #  home-manager.useGlobalPkgs = true;
          #  home-manager.useUserPackages = true;
          #  home-manager.users.jotix = import ./modules/home-manager/default.nix;
          #}
        ];
      };

      ffm-nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/ffm-config.nix
          ./modules/default.nix
          home-manager.nixosModules.home-manager #{
          #  home-manager.useGlobalPkgs = true;
          #  home-manager.useUserPackages = true;
          #  home-manager.users.jotix = import ./modules/home-manager/default.nix;
          #}
        ];
      };

    };
  };
}
