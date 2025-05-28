return {
	"saghen/blink.cmp",
	dependencies = { "rafamadriz/friendly-snippets" },

	version = "1.*",
	opts = {
		keymap = {
			preset = "default",

			["<C-p>"] = {},
			["<C-n>"] = {},
			["<C-k>"] = { "select_prev" },
			["<C-j>"] = { "select_next" },

			["<C-y>"] = {},
			["<CR>"] = { "select_and_accept" },

			["<C-s>"] = { "show_signature", "hide_signature", "fallback" },
		},
		appearance = {
			nerd_font_variant = "mono",
		},
		signature = { enable = true },
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},

		fuzzy = { implementation = "prefer_rust_with_warning" },
	},
	opts_extend = { "sources.default" },
}
