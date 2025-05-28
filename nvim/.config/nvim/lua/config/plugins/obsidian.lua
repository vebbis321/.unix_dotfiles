return {
	{
		"epwalsh/obsidian.nvim",
		version = "*",
		lazy = true,
		enable = true,
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
}
