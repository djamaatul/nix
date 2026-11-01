{ ... }: {
  programs.fish.enable = true;

  imports = [
    ../../modules/home/kde.nix
    ../../modules/home/core.nix
  ];
}
