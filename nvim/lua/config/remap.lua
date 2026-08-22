vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "File Explorer" })

-- ==================================
-- General
-- ==================================

-- Move selected lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Better navigation
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Keep cursor position after formatting paragraph
vim.keymap.set("n", "=ap", "ma=ap'a")

-- Paste without overwriting register
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste Without Yank" })

-- System clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank To Clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank Line To Clipboard" })

-- Delete without yanking
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete Without Yank" })

-- Fast escape
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Disable Ex mode
vim.keymap.set("n", "Q", "<nop>")

-- Quickfix navigation
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz", { desc = "Next Quickfix" })
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz", { desc = "Previous Quickfix" })

-- Location list navigation
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Next Location" })
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Previous Location" })

-- Search and replace word under cursor
vim.keymap.set(
	"n",
	"<leader>s",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "Replace Word Under Cursor" }
)

-- Make file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make Executable" })

-- Reload current file
vim.keymap.set("n", "<leader><leader>", function()
	vim.cmd("source %")
end, { desc = "Source File" })

vim.keymap.set("n", "<leader>tt", function()
	vim.cmd("split | terminal")
end, { desc = "Terminal Horizontal" })

vim.keymap.set("n", "<leader>tv", function()
	vim.cmd("vsplit | terminal")
end, { desc = "Terminal Vertical" })

vim.keymap.set("t", "<Esc><Esc>", [[<C-\><C-n>]])
