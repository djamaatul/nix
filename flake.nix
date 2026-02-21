{
  description = "My cross system flake";

  outputs = { nixpkgs, nix-darwin, home-manager, nixvim, ... }@inputs:
    let
      username = "djamaatul";

      home = {
        home-manager.users.${username} = ./users/djamaatul/home.nix;
      };

      variables = {
        EDITOR = "nvim";
        VISUAL = "nvim";
      };

      homeConfigs = {
        "home-manager" = {
          useGlobalPkgs = true;
          useUserPackages = true;
          backupFileExtension = "bak";
          sharedModules = [
            nixvim.homeModules.nixvim
            inputs.zen-browser.homeModules.default
            inputs.mac-app-util.homeManagerModules.default
          ];
          extraSpecialArgs = { inherit inputs; inherit username; inherit variables; };
        };
      };
    in
    {

      # darwin-rebuild switch --flake .
      darwinConfigurations.${username} = nix-darwin.lib.darwinSystem {
        specialArgs = {
          inherit variables;
        };
        modules = [
          ./hosts/darwin
          home-manager.darwinModules.home-manager
          (nixpkgs.lib.recursiveUpdate home homeConfigs)
        ];
      };

      # nixos-rebuild switch --flake .
      nixosConfigurations.${username} = nixpkgs.lib.nixosSystem {
        modules = [
          ./hosts/home
          home-manager.nixosModules.home-manager
          (nixpkgs.lib.recursiveUpdate home homeConfigs)
        ];
      };

      # nix run nixpkgs#home-manager -- switch --flake .
      homeConfigurations.${username} =
        let
          pkgs = import nixpkgs {
            system = "x86_64-linux";
            overlays = [ inputs.nixgl.overlay ];
          };
          homeVariables = (variables // { SHELL = "${pkgs.fish}/bin/fish"; });
        in
        home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs =
            {
              inherit (inputs) nixgl;
              inherit username;
              variables = homeVariables;
              inputs = { inherit (inputs) firefox-addons zen-browser; };
            };
          modules = [
            ./hosts/home
            ./users/djamaatul/home.nix
            nixvim.homeModules.nixvim
            inputs.zen-browser.homeModules.default
            inputs.dms.homeModules.dank-material-shell
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

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    mac-app-util = {
      url = "github:hraban/mac-app-util";
      inputs.cl-nix-lite.url = "github:r4v3n6101/cl-nix-lite/url-fix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixgl.url = "github:nix-community/nixGL";

    dms = {
      url = "github:AvengeMedia/DankMaterialShell/stable";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

}
