{
  plugins = {
    web-devicons.enable = true;
    treesitter.enable = true;
    smear-cursor.enable = true;
    nvim-autopairs.enable = true;
    rest.enable = true;
    flutter-tools.enable = true;
    colorizer.enable = true;
    undotree.enable = true;
  };

  imports = [
    ./comment.nix
    ./neo-tree.nix
    ./lua-line.nix
    ./buffer-line.nix
    ./colorscheme.nix
    ./lsp.nix
    ./cmp.nix
    ./gitsigns.nix
    ./dashboard.nix
    ./treesitter.nix
    ./telescope.nix
    ./snippet.nix
    ./diagnostics.nix
    ./lazygit.nix
    ./cursor.nix
    ./noice.nix
    ./visual-multi.nix
    ./toggleterm.nix
  ];
}
