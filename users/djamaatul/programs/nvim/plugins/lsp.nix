{
  plugins = {
    lsp = {
      enable = true;
      servers = {
        ts_ls.enable = true;
        cssls.enable = true;
        jsonls.enable = true;
        lua_ls.enable = true;
        gopls.enable = true;
        nixd = {
          enable = true;
          settings = {
            formatting = {
              command = [ "nixpkgs-fmt" ];
            };
          };
        };
      };
    };
  };
  keymaps = [
    { mode = "n"; key = "gd"; action = ":lua vim.lsp.buf.definition()<cr>"; }
    { mode = "n"; key = "gD"; action = ":lua vim.lsp.buf.declaration()<cr>"; }
    { mode = "n"; key = "gi"; action = ":lua vim.lsp.buf.implementation()<cr>"; }
    { mode = "n"; key = "gr"; action = ":lua vim.lsp.buf.references()<cr>"; }
    { mode = "n"; key = "gt"; action = ":lua vim.lsp.buf.type_definition()<cr>"; }

    { mode = "n"; key = "K"; action = ":lua vim.lsp.buf.hover()<cr>"; }
    { mode = "n"; key = "<C-k>"; action = ":lua vim.lsp.buf.signature_help()<cr>"; }

    { mode = "n"; key = "<leader>ca"; action = ":lua vim.lsp.buf.code_action()<cr>"; }
    { mode = "n"; key = "<leader>rn"; action = ":lua vim.lsp.buf.rename(<cr>)"; }

    { mode = "n"; key = "<leader>f"; action = ":lua vim.lsp.buf.format()<cr>"; }

    { mode = "x"; key = "<leader>ca"; action = ""; }
  ];
}
