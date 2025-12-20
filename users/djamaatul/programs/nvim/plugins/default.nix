{
  plugins.web-devicons.enable = true;
  plugins.treesitter.enable = true;
  plugins.lazygit.enable = true;
  plugins.visual-multi.enable = true;

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
  ];
}
