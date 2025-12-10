{ config, pkgs, ... }: 

{

  home.stateVersion = "25.05";

  home.username = "djamaatul";
  home.homeDirectory = "/Users/djamaatul";

  home.packages = with pkgs; [
    neofetch
    pkgs.nerd-fonts.fira-code
    fzf
  ];

  fonts.fontconfig.enable = true;

  imports = [
    ./programs/git.nix
    ./programs/alacritty.nix
    ./programs/nvim
  ];
}
