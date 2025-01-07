{
  description = "Kirill's flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.11";
    catppuccin.url = "github:catppuccin/nix";
  };

  outputs = {
    self,
    nixpkgs,
    catppuccin,
    ...
  }: let
    lib = nixpkgs.lib;
  in {
    nixosConfigurations = {
      lighthouse = lib.nixosSystem {
        system = "x86_64-linux";
        modules = [./configuration.nix catppuccin.nixosModules.catppuccin];
      };
    };
  };
}
