return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",

	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
	},

	config = function()
		require("nvim-treesitter").setup({
			highlight = {
				enable = true,
			},
		})

		require("nvim-treesitter-textobjects").setup({
			select = {
				lookahead = true,

				selection_modes = {
					["@function.outer"] = "V",
				},
			},

			move = {
				set_jumps = true,
			},
		})

		local select = require("nvim-treesitter-textobjects.select")
		local move = require("nvim-treesitter-textobjects.move")

		-- Text Objects
		vim.keymap.set({ "x", "o" }, "af", function()
			select.select_textobject("@function.outer", "textobjects")
		end, { desc = "Around Function" })

		vim.keymap.set({ "x", "o" }, "if", function()
			select.select_textobject("@function.inner", "textobjects")
		end, { desc = "Inside Function" })

		vim.keymap.set({ "x", "o" }, "ac", function()
			select.select_textobject("@class.outer", "textobjects")
		end, { desc = "Around Class " })

		vim.keymap.set({ "x", "o" }, "ic", function()
			select.select_textobject("@class.inner", "textobjects")
		end, { desc = "Inside Class" })

		-- Movement
		vim.keymap.set("n", "]m", function()
			move.goto_next_start("@function.outer", "textobjects")
		end)

		vim.keymap.set("n", "[m", function()
			move.goto_previous_start("@function.outer", "textobjects")
		end)
	end,
}
