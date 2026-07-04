{ pkgs, ... }: {
  programs.fish.enable = true;
  home.shell.enableFishIntegration = true;
  home.sessionVariables.SHELL = "${pkgs.fish}/bin/fish";
}
