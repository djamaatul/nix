{
  plugins.bufdelete.enable = true;
  plugins.bufferline = {
    enable = true;
    settings = {
      options = {
        diagnostics = "nvim_lsp";
        mode = "buffers";

        close_icon = " ";
        buffer_close_icon = "󰱝 ";
        modified_icon = "󰔯 ";

        offsets = [
          {
            filetype = "neo-tree";
            text = "Neo-tree";
            highlight = "Directory";
            text_align = "left";
          }
        ];
      };
    };
  };

  keymaps = [
   {
     mode = "n";
     key = "L";
     options.silent = true;
     action = ":BufferLineCycleNext<cr>";
   }

   {
     mode = "n";
     key = "H";
     options.silent = true;
     action = ":BufferLineCyclePrev<cr>";
   }
   {
     mode = "n";
     key = "<leader>bd";
     options.silent = true;
     action = ":Bdelete<cr>";
   }
   {
     mode = "n";
     key = "<leader>bo";
     options.silent = true;
     action = ":BufferLineCloseOthers<cr>";
   }

   {
     mode = "n";
     key = "<leader>q";
     options.silent = true;
     action = ":Bdelete<cr>";
   }
  ];
}
