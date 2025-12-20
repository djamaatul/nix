{ pkgs, ... }:

{
  programs.nixvim = { lib, ... }: {
    enable = true;

    viAlias = true;
    vimAlias = true;

    imports = [
      ./options.nix
      ./keymaps.nix
      ./autocommands.nix
      ./plugins
    ];

  };
}
