vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = false }) -- jj quickly to go to normal mode

vim.keymap.set("n", "<C-a>", "ggVG", { desc = "Select all" }) -- ctrl+a to select all
