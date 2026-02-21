let

  map = { mode, key, action, options ? { silent = true; } }: {
    inherit mode;
    inherit key;
    inherit action;
    inherit options;
  };
in
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
        dartls.enable = true;
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

  extraConfigLua = ''
    function rangeFormat()
      vim.lsp.buf.format({
        async = true,
        range = {
          ["start"] = vim.api.nvim_buf_get_mark(0, "<"),
          ["end"] = vim.api.nvim_buf_get_mark(0, ">"),
        }
      })
    end
  '';

  keymaps = [
    (map { mode = "n"; key = "gd"; action = ":lua vim.lsp.buf.definition()<cr>"; })
    (map { mode = "n"; key = "gD"; action = ":lua vim.lsp.buf.declaration()<cr>"; })
    (map { mode = "n"; key = "gi"; action = ":lua vim.lsp.buf.implementation()<cr>"; })
    (map { mode = "n"; key = "gr"; action = ":lua vim.lsp.buf.references()<cr>"; })
    (map { mode = "n"; key = "gt"; action = ":lua vim.lsp.buf.type_definition()<cr>"; })

    (map { mode = "n"; key = "K"; action = ":lua vim.lsp.buf.hover()<cr>"; })

    (map { mode = "n"; key = "<leader>ca"; action = ":lua vim.lsp.buf.code_action()<cr>"; })
    (map { mode = "n"; key = "<leader>rn"; action = ":lua vim.lsp.buf.rename()<cr>"; })

    (map { mode = "n"; key = "<leader>cf"; action = ":lua vim.lsp.buf.format({ async = true })<cr>"; })

    (map { mode = "v"; key = "<leader>cf"; action = ":lua rangeFormat()<cr>"; })

  ];
}
