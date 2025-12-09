{
  description = "My cross system flake";

  outputs = inputs@{ self, nixpkgs, nix-darwin, home-manager, nixvim, ... }: 
  let 

    username = "djamaatul";

    home = {
      home-manager.users.${username} = ./users/djamaatul/home.nix;
    };

    homeConfigs = {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.backupFileExtension = "bak";
      home-manager.sharedModules = [
        nixvim.homeModules.nixvim
      ];
    };

  in {

    darwinConfigurations.${username} = nix-darwin.lib.darwinSystem {
      modules = [
        ./hosts/darwin
        home-manager.darwinModules.home-manager
        (nixpkgs.lib.recursiveUpdate home homeConfigs)
      ];
    };

    nixosConfigurations.${username} = nixpkgs.lib.nixosSystem {
      modules = [
        ./hosts/linux
        home-manager.nixosModules.home-manager
        (nixpkgs.lib.recursiveUpdate home homeConfigs)
      ];
    };

    homeConfigurations.${username} = home-manager.lib.homeManagerConfiguration {
      modules = [ 
        homeConfigs
        ./hosts/home
        ./users/djamaatul/home.nix
      ];
    };

  };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nixvim.url = "github:nix-community/nixvim";
  };

}
