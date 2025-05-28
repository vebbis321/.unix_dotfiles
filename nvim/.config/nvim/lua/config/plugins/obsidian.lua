return {
	{
		"epwalsh/obsidian.nvim",
		version = "*",
		lazy = true,
		ft = "markdown",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		opts = {
			workspaces = {
				{
					name = "notes",
					path = "~/notes/",
				},
			},
			ui = { enable = false },
		},
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
		config = function()
			require("render-markdown").setup({
				render_modes = true,
			})
		end,
	},
	{
		"folke/snacks.nvim",
		opts = {
			image = {
				enabled = true,
				doc = {
					float = false,
					inline = true,
					max_width = 50,
					max_height = 30,
					wo = {
						wrap = true,
					},
				},
				convert = {
					notify = true,
					command = "magick",
				},
				img_dirs = { "img", "images", "assets", "static", "public", "media", "attachments", "~/notes" },
			},
		},
	},
}
