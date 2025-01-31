{
  description = "Kirill's flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.11";
    catppuccin.url = "github:catppuccin/nix";
    ghostty.url = "github:ghostty-org/ghostty";
  };

  outputs = {
    self,
    nixpkgs,
    catppuccin,
    ghostty,
    ...
  } @ inputs: let
    lib = nixpkgs.lib;
  in {
    nixosConfigurations = {
      lighthouse = lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          inherit inputs;
        };
        modules = [./configuration.nix catppuccin.nixosModules.catppuccin];
      };
    };
  };
}
