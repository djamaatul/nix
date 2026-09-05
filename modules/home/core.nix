{ variables, pkgs, inputs, ... }: {
  home.stateVersion = "25.11";
  home.sessionVariables = variables;

  nixpkgs.overlays = [ inputs.opencode.overlays.default ];
  home.packages = with pkgs; [
    neofetch
    pkgs.nerd-fonts.fira-code
    fzf
    lua
    lazygit
    curl
    ranger
    ripgrep
    opencode
  ];

  fonts.fontconfig.enable = true;

  imports = [
    ./alacritty.nix
    ./fish.nix
    ./nvim
  ];
}
