{
  description = "My cross system flake";

  outputs = { nixpkgs, nix-darwin, home-manager, nixvim, ... }@inputs:
    let
      variables = {
        EDITOR = "nvim";
        VISUAL = "nvim";
      };

      hmModule = {
        home-manager = {
          users.djamaatul.imports = [ ./users/djamaatul/home.nix ];
          useGlobalPkgs = true;
          useUserPackages = true;
          backupFileExtension = "bak";
          sharedModules = [
            nixvim.homeModules.nixvim
            inputs.zen-browser.homeModules.default
            inputs.mac-app-util.homeManagerModules.default
            inputs.dms.homeModules.dank-material-shell
          ];
          extraSpecialArgs = { inherit inputs; inherit variables; };
        };
      };

      mkStandaloneHM = host: extraModules:
        let
          pkgs = import nixpkgs {
            system = "x86_64-linux";
            overlays = [ inputs.nixgl.overlay ];
          };
        in
        home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = {
            inherit (inputs) nixgl;
            inherit variables;
            inputs = { inherit (inputs) firefox-addons zen-browser; };
          };
          modules = [
            host
            ./users/djamaatul/home.nix
            nixvim.homeModules.nixvim
            inputs.zen-browser.homeModules.default
          ] ++ extraModules;
        };
    in
    {
      # darwin-rebuild switch --flake .
      darwinConfigurations.default = nix-darwin.lib.darwinSystem {
        specialArgs = { inherit variables; };
        modules = [
          ./hosts/darwin
          home-manager.darwinModules.home-manager
          hmModule
        ];
      };

      # nixos-rebuild switch --flake .
      nixosConfigurations.default = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/nixos
          home-manager.nixosModules.home-manager
          hmModule
        ];
      };

      # nix run nixpkgs#home-manager -- switch --flake .
      homeConfigurations.default = mkStandaloneHM ./hosts/home [
        inputs.dms.homeModules.dank-material-shell
      ];

      # nix run nixpkgs#home-manager -- switch --flake .#debian
      homeConfigurations.debian = mkStandaloneHM ./hosts/debian [ ];
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
