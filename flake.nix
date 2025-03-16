{
  description = "My NixOS configuration using Flakes";

  inputs = {
    # Fetching Nixpkgs from GitHub
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # home-manager, used for managing user configurations
    home-manager = {
      url = "github:nix-community/home-manager";
      # Ensure home-manager's nixpkgs input follows the same version as the main flake's nixpkgs
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    # NixOS configuration for the host with the hostname `nndmw`
    nixosConfigurations.nndmw = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        # Main system configuration file
        ./configuration.nix

        # Include home-manager as a module in NixOS
        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;

          # Replace with your own username (e.g., `nndmw`)
          home-manager.users.nndmw = import ./home.nix;

          # Optionally, pass extra arguments to `home.nix` if needed
        }
      ];
    };
  };
}

