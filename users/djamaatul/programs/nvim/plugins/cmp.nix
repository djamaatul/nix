{
  plugins = {
    cmp = {
      enable = true;
      settings = {
        preselect = "cmp.PreselectMode.None";
        # completion.autocomplete = false;
        mapping = {
          "<C-n>" = "cmp.mapping.select_next_item()";
          "<C-p>" = "cmp.mapping.select_prev_item()";
          "<CR>" = "cmp.mapping.confirm({ select = true })";
          "<Tab>" = "cmp.mapping.confirm({ select = true })";
          "<C-Space>" = "cmp.mapping.complete()";
        };
        sources = [
          { name = "nvim_lsp"; }
          { name = "buffer"; }
          { name = "path"; }
          { name = "luasnip"; }
        ];
      };
    };
    cmp-nvim-lsp.enable = true;
    cmp-path.enable = true;
    cmp-buffer.enable = true;
    luasnip.enable = true;
    lspkind.enable = true;
    lint = {
      enable = true;
      lintersByFt = {
        gitcommit = [ "gitlint" ];
      };
    };
  };
}
