-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local unmap = vim.keymap.del
unmap("n", "<c-/>")
unmap("n", "<c-_>")
--
local map = vim.keymap.set
map("n", ";", ":", { desc = "CMD enter command mode", silent = true })
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "force quit" })
map("n", "ap", "ggVGp", { desc = "select all and paste" })
map("n", "ay", "ggVGy", { desc = "select all and copy" })
map("n", "ad", "ggVGd", { desc = "select all and del" })
map("n", "ac", "ggVGc", { desc = "select all and change" })

map("n", "<c-/>", function()
  Snacks.terminal.toggle(vim.o.shell, { cwd = LazyVim.root() })
end, { desc = "Terminal (Float)" })
map("n", "<c-_>", function()
  Snacks.terminal.toggle(vim.o.shell, { cwd = LazyVim.root() })
end, { desc = "Terminal (Float)" })
