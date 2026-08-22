return {
	"stevearc/oil.nvim",

	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},

	opts = {
		watch_for_changes = true,
		show_hidden = true,

		skip_confirm_for_simple_edits = true,

		view_options = {
			show_hidden = true,
		},

		keymaps = {
			["<C-h>"] = false,
			["<C-j>"] = false,
			["<C-k>"] = false,
			["<C-l>"] = false,
		},
	},
	config = function(_, opts)
		require("oil").setup(opts)
		vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open Parent Directory" })
	end,
}
