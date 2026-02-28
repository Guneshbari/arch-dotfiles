-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
vim.keymap.set("n", "<leader>t", function()
  vim.cmd("botright split")
  vim.cmd("resize 15")
  vim.cmd("terminal ++curwin ++cwd")
  vim.cmd("startinsert")
end, { desc = "Open terminal at bottom (correct cwd)" })
