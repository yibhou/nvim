-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("i", "jj", "<Esc>", { silent = true })

-- hop.nvim
vim.keymap.set("n", "s", ":lua require('hop').hint_words()<CR>", { silent = true, remap = true })
vim.keymap.set("i", "<C-h>", "<Esc>:lua require('hop').hint_words()<CR>", { silent = true })
