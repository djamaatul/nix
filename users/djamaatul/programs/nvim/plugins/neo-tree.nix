{
  plugins.neo-tree = {
    enable = true;
    settings = {
      close_if_last_window = false;
      window = {
        width = 30;
        mappings = {
          l = "open";
        };
      };
    };
  };
  extraConfigLua = ''
    vim.api.nvim_create_autocmd({ "BufLeave" }, {
      pattern = { "*lazygit*" },
      group = vim.api.nvim_create_augroup("git_refresh_neotree", {clear = true}),
      callback = function()
        require("neo-tree.sources.filesystem.commands").refresh(
          require("neo-tree.sources.manager").get_state("filesystem")
        )
      end,
    })
  '';
  keymaps = [
    {
      mode = "n";
      key = "<leader>e";
      options.silent = true;
      action = ":Neotree reveal toggle<CR>";
    }
    {
      mode = "n";
      key = "<leader>gs";
      options.silent = true;
      action = ":Neotree float git_status<CR>";
    }

  ];
}
