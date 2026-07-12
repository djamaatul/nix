{ variables, pkgs, ... }: {
  home.stateVersion = "25.11";
  home.sessionVariables = variables;

  home.packages = with pkgs; [
    neofetch
    pkgs.nerd-fonts.fira-code
    fzf
    lua
    lazygit
    curl
    ranger
    ripgrep
  ];

  fonts.fontconfig.enable = true;

  imports = [
    ./alacritty.nix
    ./fish.nix
    ./nvim
  ];
}
