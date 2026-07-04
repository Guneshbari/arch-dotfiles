return {
	"saghen/blink.cmp",

	dependencies = {
		"rafamadriz/friendly-snippets",
	},

	version = "*",

	opts = {
		keymap = {
			preset = "default",

			["<CR>"] = {
				"select_and_accept",
				"fallback",
			},
		},

		appearance = {
			nerd_font_variant = "mono",
		},

		completion = {
			documentation = {
				auto_show = true,
			},

			list = {
				selection = {
					preselect = true,
					auto_insert = false,
				},
			},
		},

		sources = {
			default = {
				"lsp",
				"path",
				"snippets",
				"buffer",
			},
		},
	},
}
