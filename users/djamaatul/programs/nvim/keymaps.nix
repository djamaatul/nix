{
  globals = {
    mapleader = " ";
    maplocalleader = " ";
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>e";
      action = ":Explore<CR>";
    }     
    {
      mode = "n";
      key = "<leader>q";
      action = ":bdelete";
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
      action = ":bprevious<CR>";
    }     
    {
      mode = "n";
      key = "L";
      action = ":bnext<CR>";
    }     

    {
      mode = "n";
      key = "J";
      action = ".+1<CR>==";
    }     
    {
      mode = "n";
      key = "K";
      action = ".-1<CR>==";
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
      mode = "n";
      key = "<";
      action = "<gv";
    }     

    {
      mode = "n";
      key = "<leader>-";
      action = "spl<CR>";
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
      action = "\"_dd";
    }     
    {
      mode = "n";
      key = "dd";
      action = "\"_dd";
    }     

    {
      mode = "v";
      key = "d";
      action = "\"_d";
    }     
    {
      mode = "v";
      key = "c";
      action = "\"_c";
    }     
  ];
}

