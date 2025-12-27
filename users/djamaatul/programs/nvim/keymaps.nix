{
  globals = {
    mapleader = " ";
    maplocalleader = " ";
  };

  keymaps = [
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
      key = "<c-tab>";
      options.silent = true;
      action = ":bnext<CR>";
    }

    {
      mode = "n";
      key = "<leader><space>";
      options.silent = true;
      action = ":noh<CR>";
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
      key = "x";
      action = "d";
      options.noremap = false;
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
      key = "d";
      action = ''"_d'';
    }
    {
      mode = "n";
      key = "D";
      action = ''"_D'';
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
      key = "C";
      action = ''"_C'';
    }
    {
      mode = "n";
      key = "c";
      action = ''"_c'';
    }

    {
      mode = "x";
      key = "p";
      options.silent = true;
      action = ''"_dP"'';
    }

    {
      mode = "t";
      key = "<esc>";
      options.silent = true;
      action = "<c-\\><c-n>";
    }

    {
      mode = "";
      key = "<leader>y";
      options.silent = true;
      action = ''"+y'';
    }
    {
      mode = "";
      key = "<leader>p";
      options.silent = true;
      action = ''"+p'';
    }

  ];
}

