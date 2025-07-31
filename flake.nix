{
  description = "Jacob's NixOS config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      # Define a common function to import nixpkgs and set config
      importPkgs = system: import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };

      # Define the systems you want to support
      supportedSystems = [ "x86_64-linux" "aarch64-linux" ];

      # A helper to apply a function to each supported system
      forAllSystems = f: nixpkgs.lib.genAttrs supportedSystems (system: f system);

    in {
      # This is the key change. Define nixosConfigurations at the top level.
      nixosConfigurations = {
        desktop = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux"; # You must specify the system here
          modules = [
            ./hosts/desktop.nix
            # You can also define your packages here using a single pkgs import
            ({ config, pkgs, ... }: {
              nixpkgs.config.allowUnfree = true;
	      nixpkgs.config.permittedInsecurePackages = [
	        "libsoup-2.74.3"
	      ];
            })
            home-manager.nixosModules.home-manager {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;

              home-manager.users.jacobtw = import ./home/jacobtw.nix;
            }
          ];
        };
        # You could add other hosts here, e.g., 'laptop'
        # laptop = nixpkgs.lib.nixosSystem { ... };
      };

      # You can still use a helper like flake-utils to define packages for other systems
      # This is useful for `nix build` or `nix shell` commands
      packages = forAllSystems (system:
        let pkgs = importPkgs system; in {
          # Define packages here, e.g.,
          # my-package = pkgs.hello;
        });

      # You can also add dev shells
      devShells = forAllSystems (system:
        let pkgs = importPkgs system; in {
          # my-dev-shell = pkgs.mkShell { ... };
        });
    };
}
