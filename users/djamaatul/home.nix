{ pkgs, username, ... }:

{

  nixpkgs.config.allowUnfree = true;

  home.stateVersion = "25.11";
  home.username = username;
  home.homeDirectory = "/home/${username}";

  home.packages = with pkgs; [
    neofetch
    pkgs.nerd-fonts.fira-code
    fzf
    podman
    lua
    lazygit
    curl
    dbeaver-bin
    ranger
  ];

  fonts.fontconfig.enable = true;

  imports = [
    ./programs/git.nix
    ./programs/alacritty.nix
    ./programs/nvim
    ./programs/browser
  ];
}
