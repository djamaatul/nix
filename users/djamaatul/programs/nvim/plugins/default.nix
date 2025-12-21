{
  plugins = {
    web-devicons.enable = true;
    treesitter.enable = true;
    visual-multi.enable = true;
    smear-cursor.enable = true;
    autoclose.enable = true;
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
  ];
}
