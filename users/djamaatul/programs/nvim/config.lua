require("textcase").setup {
  lazy = false
}
vim.api.nvim_set_keymap("v", "<leader>cc", "<cmd>TextCaseOpenTelescope<CR>", { desc = "Telescope" })
vim.api.nvim_set_keymap("n", "<leader>cc", "<cmd>TextCaseOpenTelescope<CR>", { desc = "Telescope" })
