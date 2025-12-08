{ pkgs, config, ... }:

{

  nixpkgs.config.allowUnfree = true;
  nixpkgs.hostPlatform = "aarch64-darwin";

  system.stateVersion = 6;
  system.primaryUser = "djamaatul";

  imports = [
    ../../modules/darwin/homebrew.nix
  ];

  security.pam.services.sudo_local.touchIdAuth = true;
  networking.hostName = "djamaatul";

  #users.knownUsers = [ "djamaatul" ];
  users.users.djamaatul = {
    description = "D. Jama'atul Anbiya";
    home = "/Users/djamaatul";
    uid = 501;
    shell = pkgs.fish;
  };

  system.defaults = {
    dock.autohide = true;
    finder.AppleShowAllExtensions = true;
    finder.FXPreferredViewStyle = "Nlsv";
    screencapture.location = "~/Pictures/screenshots";
  };

  time.timeZone = "Asia/Jakarta";

  environment.pathsToLink = [ "/Applications" ];
  environment.systemPackages = with pkgs; [
    alacritty
  ];
  environment.systemPath = [
    "/opt/homebrew/bin"
    "/opt/homebrew/sbin"
  ];


  programs.fish = {
    enable = true;
    useBabelfish = true;
  };

}
