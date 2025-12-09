{ pkgs, ... }:

{
  programs.nixvim = { lib, ... }: {
    enable = true;
    defaultEditor = true;

    viAlias = true;

    imports = [
      ./options.nix
      ./keymaps.nix
      ./plugins
    ];

  };
}
