{ config, pkgs, ... }: 

{

  home.stateVersion = "25.05";

  home.username = "djamaatul";
  home.homeDirectory = "/Users/djamaatul";

  home.packages = with pkgs; [
    neofetch
  ];


  imports = [
    ./programs/git.nix
    ./programs/alacritty.nix
  ];
}
