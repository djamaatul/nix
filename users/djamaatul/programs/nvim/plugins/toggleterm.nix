{
  plugins.toggleterm = {
    enable = true;
    settings = {
      open_mapping = "[[<c-/>]]";
      start_in_insert = true;
      close_on_exit = true;
      persist_mode = false;
    };
  };

  extraConfigLua = ''
    function _G.set_terminal_keymaps()
      local opts = {buffer = 0}
      vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
      vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
      vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
      vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
      vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
      vim.keymap.set('t', '<C-n>', [[<Cmd>TermNew<CR>]], opts)
      vim.keymap.set('t', '<C-w>', [[<Cmd>bdelete!<CR>]], opts)
    end

    vim.api.nvim_create_autocmd("TermOpen", {
      pattern = "term://*toggleterm#*",
      callback = function()
        set_terminal_keymaps()
      end,
    })
  '';
}
