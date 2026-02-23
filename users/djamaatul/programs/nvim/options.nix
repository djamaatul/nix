{
  opts = {
    updatetime = 100;
    relativenumber = true;
    number = true;
    mouse = "a";
    tabstop = 2;
    shiftwidth = 2;
    expandtab = true;
    wrap = false;
    shell = "fish";
    cursorline = true;
    signcolumn = "yes";

    winborder = "shadow";
    swapfile = false;
    undofile = true;
  };

  diagnostic.settings = {
    virtual_lines = {
      current_line = true;
    };
    virtual_text = true;
  };
}
