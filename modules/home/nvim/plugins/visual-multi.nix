{
  plugins.visual-multi = {
    enable = true;
    settings = {
      reselect_first = 1;
      silent_exit = 1;
      default_mappings = 1;
    };
  };

  extraConfigLua = ''
    vim.g.VM_maps = {
      ["I BS"] = ""
    }
  '';
}
