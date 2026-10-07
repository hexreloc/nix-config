{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    zen-browser.url = "github:0xc000022070/zen-browser-flake";

    stylix.url = "github:nix-community/stylix";

    home-manager = {
      url = "git+https://github.com/nix-community/home-manager.git";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, stylix, zen-browser }@inputs: let
    system = "x86_64-linux";
  in {
    nixosConfigurations.nixos-btw = nixpkgs.lib.nixosSystem {
      system = system;

      modules = [
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
              inherit inputs;
            };

            users.hex = import ./hosts/victus/home.nix;

            backupFileExtension = "backup";
          };
        }
      ];
    };
  };
}
