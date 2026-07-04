{
  plugins.telescope = {
    enable = true;
    extensions =
      {
        ui-select.enable = true;
        fzf-native.enable = true;
      };
    settings = {
      defaults = {
        results_title = false;
        sorting_strategy = "ascending";
        layout_config = {
          prompt_position = "top";
        };
      };
    };
  };
  keymaps = [
    {
      mode = "n";
      key = "<leader>ff";
      action = "<cmd>Telescope find_files<CR>";
      options.silent = true;
    }
    {
      mode = "n";
      key = "<leader>fg";
      action = "<cmd>Telescope live_grep<CR>";
      options.silent = true;
    }
    {
      mode = "n";
      key = "<leader>fb";
      action = "<cmd>Telescope buffers<CR>";
      options.silent = true;
    }
    {
      mode = "n";
      key = "<leader>fd";
      action = "<cmd>lua require('telescope.builtin').diagnostics({ sort_by = 'severity' })<CR>";
      options.silent = true;
    }
    {
      mode = "n";
      key = "<leader>dd";
      action = "<cmd>Telescope diagnostics bufnr=0<CR>";
      options.silent = true;
    }
  ];
}
