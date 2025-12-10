{
  globals = {
    mapleader = " ";
    maplocalleader = " ";
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>e";
      options.silent = true;
      action = ":Neotree reveal toggle<CR>";
    }

    {
      mode = "n";
      key = "<leader>q";
      options.silent = true;
      action = ":bdelete<CR>";
    }

    {
      mode = "n";
      key = "<c-h>";
      action = "<c-w>h";
    }
    {
      mode = "n";
      key = "<c-j>";
      action = "<c-w>j";
    }
    {
      mode = "n";
      key = "<c-k>";
      action = "<c-w>k";
    }
    {
      mode = "n";
      key = "<c-l>";
      action = "<c-w>l";
    }
    {
      mode = "n";
      key = "H";
      options.silent = true;
      action = ":bprevious<CR>";
    }
    {
      mode = "n";
      key = "L";
      options.silent = true;
      action = ":bnext<CR>";
    }

    {
      mode = "v";
      key = "J";
      action = ":m '<+2<CR>gv=gv";
    }
    {
      mode = "v";
      key = "K";
      action = ":m '<-2<CR>gv=gv";
    }

    {
      mode = "n";
      key = ">";
      action = ">>";
    }
    {
      mode = "n";
      key = "<";
      action = "<<";
    }
    {
      mode = "v";
      key = ">";
      action = ">gv";
    }
    {
      mode = "v";
      key = "<";
      action = "<gv";
    }

    {
      mode = "n";
      key = "<leader>-";
      action = ":spl<CR>";
    }
    {
      mode = "n";
      key = "<leader><bar>";
      action = ":vspl<CR>";
    }

    {
      mode = "n";
      key = "xx";
      action = "dd";
    }
    {
      mode = "n";
      key = "dd";
      action = ''"_dd'';
    }
    {
      mode = "n";
      key = "dd";
      action = ''"_dd'';
    }

    {
      mode = "v";
      key = "d";
      action = ''"_d'';
    }
    {
      mode = "v";
      key = "c";
      action = ''"_c'';
    }
    
    {
      mode = "n";
      key = "<c-/>";
      options.silent = true;
      options.noremap = true;
      action = ":term<CR>";
    }
    {
      mode = "t";
      key = "<esc>";
      action = "<c-\\><c-n>";
    }
  ];
}

