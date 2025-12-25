{ pkgs, ... }:

{

  home.stateVersion = "25.05";

  home.username = "djamaatul";
  home.homeDirectory = "/Users/djamaatul";

  home.packages = with pkgs; [
    neofetch
    pkgs.nerd-fonts.fira-code
    fzf
    podman
    go
    lua
    lazygit
    curl
    dbeaver-bin
  ];

  fonts.fontconfig.enable = true;
  targets.darwin.linkApps.enable = true;

  imports = [
    ./programs/git.nix
    ./programs/alacritty.nix
    ./programs/nvim
    ./programs/browser
  ];
}
