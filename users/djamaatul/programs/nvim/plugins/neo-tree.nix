{
  plugins.neo-tree = {
    enable = true;
    settings = {
      close_if_last_window = false;
      #open_on_setup = false;
      #open_on_setup_file = false;
      window = {
        width = 30;
        mappings = {
          l = "open";
        };
      };
    };
  };
  keymaps = [
    {
      mode = "n";
      key = "<leader>e";
      options.silent = true;
      action = ":Neotree reveal toggle<CR>";
    }
  ];
}
