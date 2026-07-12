{
  plugins.opencode = {
    enable = true;
    settings = {
      auto_reload = true;
      port = 4096;
    };
  };

  extraConfigLua = ''
    local Terminal = require("toggleterm.terminal").Terminal

    OpenCodeTerm = Terminal:new({
        cmd = "opencode --port 4096",
        direction = "float",
        close_on_exit = false,
        hidden = true,
        size = 20,
        float_opts = {
          border = "rounded",
          winblend = 0,
          highlights = {
            border = "Normal",
            background = "Normal",
          },
        },
        on_open = function(term)

        pcall(vim.keymap.del, "t", "<c-n>", { buffer = term.bufnr })
        pcall(vim.keymap.del, "n", "<c-n>", { buffer = term.bufnr })

         vim.keymap.set("n", "<Esc>", function()
            OpenCodeTerm:close()
          end, {
            buffer = term.bufnr,
            silent = true,
          })

          vim.cmd("startinsert")
        end,
     })
  '';

  opts.autoread = true;

  keymaps = [
    {
      mode = "n";
      key = "<leader>oo";
      action = "<cmd>lua OpenCodeTerm:toggle()<CR>";
    }
    {
      mode = [ "n" "x" ];
      key = "<leader>oa";
      action = "<cmd>lua require('opencode').ask('@this: ', { submit = true })<CR>";
    }

    {
      mode = [ "n" "x" ];
      key = "<leader>of";
      action = "<cmd>lua require('opencode').ask('@buffer: ', { submit = true })<CR>";
    }

    {
      mode = [ "n" "x" ];
      key = "<leader>os";
      action = "<cmd>lua require('opencode').select()<CR>";
    }
  ];
}
