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
        tailwindcss.enable = true;
        csharp_ls.enable = true;
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
    (map { mode = "n"; key = "gd"; action = ":Telescope lsp_definitions<cr>"; })
    (map { mode = "n"; key = "gi"; action = ":Telescope lsp_implementations<cr>"; })
    (map { mode = "n"; key = "gr"; action = ":Telescope lsp_references<cr>"; })
    (map { mode = "n"; key = "gt"; action = ":Telescope lsp_type_definitions<cr>"; })

    (map { mode = "n"; key = "<s-k>"; action = ":lua vim.lsp.buf.hover()<cr>"; })

    (map { mode = "n"; key = "<leader>ca"; action = ":lua vim.lsp.buf.code_action()<cr>"; })
    (map { mode = "n"; key = "<leader>rn"; action = ":lua vim.lsp.buf.rename()<cr>"; })

    (map { mode = "n"; key = "<leader>cf"; action = ":lua vim.lsp.buf.format({ async = true })<cr>"; })

    (map { mode = "v"; key = "<leader>cf"; action = ":lua rangeFormat()<cr>"; })

  ];
}
