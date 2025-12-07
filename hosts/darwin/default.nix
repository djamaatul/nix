{ pkgs, config, ... }:

{

  nixpkgs.config.allowUnfree = true;
  nixpkgs.hostPlatform = "aarch64-darwin";

  system.stateVersion = 6;
  system.primaryUser = "djamaatul";

  imports = [
    ../../modules/darwin/homebrew.nix
  ];

  networking.hostName = "djamaatul";

  users.users.djamaatul = {
    description = "D. Jama'atul Anbiya";
    home = "/Users/djamaatul";
  };

}
