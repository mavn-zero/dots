-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = false }) -- jj quickly to go to normal mode

vim.keymap.set("n", "<C-a>", "ggVG", { desc = "Select all" }) -- ctrl+a to select all
