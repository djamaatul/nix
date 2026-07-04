{
  programs.nixvim = { pkgs, ... }: {
    enable = true;

    viAlias = true;
    vimAlias = true;

    extraPlugins = [
      pkgs.vimPlugins.text-case-nvim
    ];

    extraConfigLua = builtins.readFile ./config.lua;

    imports = [
      ./options.nix
      ./keymaps.nix
      ./autocommands.nix
      ./plugins
    ];

  };
}
