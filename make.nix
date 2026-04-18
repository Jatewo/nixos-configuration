{inputs, ...}: let
  mkNixOS = {
    hostname,
    system ? "x86_64-linux",
  }:
    inputs.nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {inherit inputs;};

      modules = [
        hosts/${hostname}/configuration.nix
        {
          networking.hostName = hostname;

          nixpkgs = {
            system = system;
            config.allowUnfree = true;
          };
          nixpkgs.config.permittedInsecurePackages = [
            "libsoup-2.74.3"
          ];
          nix.nixPath = [
            "nixpkgs=${inputs.nixpkgs}"
          ];
          nix.registry = {
            nixpkgs.flake = inputs.nixpkgs;
          };
        }

        inputs.lanzaboote.nixosModules.lanzaboote
        inputs.home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = {inherit inputs;};
        }
      ];
    };
in {
  inherit mkNixOS;
}
