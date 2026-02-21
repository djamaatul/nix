{
  plugins.visual-multi = {
    enable = true;
    settings = {
      reselect_first = 1;
      silent_exit = 1;
      default_mappings = 0;
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<C-d>";
      action = "<Plug>(VM-Find-Under)";
    }
    {
      mode = "n";
      key = "<C-d>";
      action = "<Plug>(VM-Find-Under)";
    }
  ];
}
