{
  plugins.lazygit = {
    enable = true;
  };
  keymaps = [
    {
      mode = "n";
      key= "<leader>lg";
      action = ":LazyGit<cr>";
    }
  ];
}
