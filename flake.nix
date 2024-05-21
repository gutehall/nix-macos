{
  description = "Nix on macOS";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:lnl7/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    mac-app-util.url = "github:hraban/mac-app-util";
  };

  outputs = inputs@{ self, nix-darwin, home-manager, nixpkgs, mac-app-util }:
    {
      darwinConfigurations."private" = nix-darwin.lib.darwinSystem {
        modules = [
          ./hosts/private/configuration.nix

          mac-app-util.darwinModules.default

          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.verbose = true;
            home-manager.users.mathias.imports = [ ./hosts/private/home.nix mac-app-util.homeManagerModules.default ];
          }
        ];
      };

      darwinConfigurations."work" = nix-darwin.lib.darwinSystem {
        modules = [
          ./hosts/work/configuration.nix

          mac-app-util.darwinModules.default

          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.verbose = true;
            home-manager.users.mathias.imports = [ ./hosts/work/home.nix mac-app-util.homeManagerModules.default ];
          }
        ];
      };
    };
}
