{
  plugins.neo-tree = {
    enable = true;
    settings = {
      close_if_last_window = true;
      sources = [
        "filesystem"
        "git_status"
        "document_symbols"
      ];
      source_selector = {
        winbar = true;
        statusline = false;
        sources = [
          { source = "filesystem"; }
          { source = "git_status"; }
          { source = "document_symbols"; }
        ];
      };
      filesystem = {
        filtered_items = {
          visible = true;
          hide_dotfiles = false;
          hide_gitignored = false;
          never_show = [ ".git" ];
        };
      };
      window = {
        width = 30;
        mappings = {
          l = "open";
          h = "close_node";
          H = "prev_source";
          L = "next_source";
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
      action = ":Neotree left reveal toggle<CR>";
    }
    {
      mode = "n";
      key = "<leader>fe";
      options.silent = true;
      action = ":Neotree float reveal<CR>";
    }
    {
      mode = "n";
      key = "<leader>gs";
      options.silent = true;
      action = ":Neotree float git_status<CR>";
    }

  ];
}
