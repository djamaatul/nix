{ pkgs, variables, ... }:

{

  nixpkgs.config.allowUnfree = true;
  nixpkgs.hostPlatform = "aarch64-darwin";

  system.stateVersion = 6;
  system.primaryUser = "djamaatul";

  imports = [
    ../../modules/darwin/system.nix
    ../../modules/darwin/homebrew.nix
    ../../modules/darwin/aerospace.nix
  ];

  security.pam.services.sudo_local.touchIdAuth = true;
  networking.hostName = "djamaatul";

  users.users.djamaatul = {
    description = "D. Jama'atul Anbiya";
    home = "/Users/djamaatul";
    uid = 501;
    shell = pkgs.fish;
  };

  time.timeZone = "Asia/Jakarta";

  # environment.pathsToLink = [ "/Applications" ];
  environment.systemPackages = with pkgs; [
    alacritty
  ];

  environment.systemPath = [
    "/opt/homebrew/bin"
    "/opt/homebrew/sbin"
  ];

  environment.variables = variables;

  programs.fish = {
    enable = true;
    useBabelfish = true;
  };
}
