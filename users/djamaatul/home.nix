{ pkgs, ... }:
let
  username = "djamaatul";

  git = import ../../modules/home/git.nix {
    name = "djamaatul";
    email = "djamaatul.anbiya@gmail.com";
  };
in
{
  nixpkgs.config.allowUnfree = true;

  home.username = username;
  home.homeDirectory = pkgs.lib.mkDefault "/home/${username}";

  home.packages = with pkgs; [
    podman
    dbeaver-bin
  ];

  imports = [
    ../../modules/home/core.nix
    git
    ../../modules/home/browser
    #../../modules/home/android-emulator.nix
  ];
}
