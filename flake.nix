{
  description = "Hex's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    zen-browser.url = "github:0xc000022070/zen-browser-flake";

    stylix.url = "github:nix-community/stylix";

    home-manager = {
      url = "git+https://github.com/nix-community/home-manager.git";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    stylix,
    ...
  } @ inputs: let
    system = "x86_64-linux";

    inherit (self) outputs;
  in {
    # Custom packages from ./pkgs, buildable with `nix build .#<name>`
    packages.${system} = import ./pkgs nixpkgs.legacyPackages.${system};

    # Formatter, available through `nix fmt`
    formatter.${system} = nixpkgs.legacyPackages.${system}.alejandra;

    # Overlays from ./overlays
    overlays = import ./overlays {
      inherit inputs;
    };

    # Reusable modules from ./modules
    nixosModules = import ./modules/nixos;
    homeManagerModules = import ./modules/home-manager;

    # System configurations, available through
    # `nixos-rebuild switch --flake .#nixos-btw`
    nixosConfigurations.nixos-btw = nixpkgs.lib.nixosSystem {
      system = system;

      specialArgs = {
        inherit inputs outputs;
      };

      modules = [
        # Main host configuration
        ./hosts/victus

        stylix.nixosModules.stylix
        home-manager.nixosModules.home-manager

        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;

            sharedModules = [
              stylix.homeModules.stylix
            ];

            extraSpecialArgs = {
              inherit inputs outputs;
            };

            users.hex = import ./home/hex;

            backupFileExtension = "backup";
          };
        }
      ];
    };
  };
}
