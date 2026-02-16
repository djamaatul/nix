{
  plugins.lazygit = {
    enable = true;
  };
  keymaps = [
    {
      mode = "n";
      key = "<leader>gg";
      action = ":LazyGit<cr>";
    }
    {
      mode = "n";
      key = "<leader>gf";
      action = ":LazyGitFilterCurrentFile<cr>";
    }
  ];
}
