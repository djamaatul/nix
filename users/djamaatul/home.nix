{ pkgs, ... }:

{

  home.stateVersion = "25.11";

  home.username = "djamaatul";
  home.homeDirectory = "/home/djamaatul";

  home.packages = with pkgs; [
    neofetch
    pkgs.nerd-fonts.fira-code
    fzf
    podman
    bun
    go
    lua
    lazygit
    curl
    dbeaver-bin
  ];

  fonts.fontconfig.enable = true;

  imports = [
    ./programs/git.nix
    ./programs/alacritty.nix
    ./programs/nvim
    ./programs/browser
  ];
}
