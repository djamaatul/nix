require("textcase").setup {
  lazy = false
}
vim.api.nvim_set_keymap("v", "<leader>tc", "<cmd>TextCaseOpenTelescope<CR>", { desc = "Telescope" })
vim.api.nvim_set_keymap("n", "<leader>tc", "<cmd>TextCaseOpenTelescope<CR>", { desc = "Telescope" })
