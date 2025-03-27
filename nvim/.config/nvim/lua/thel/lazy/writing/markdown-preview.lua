return {
	"iamcco/markdown-preview.nvim",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	build = "cd app && npm install && git restore .",
	-- or if you use yarn: (I have not checked this, I use npm)
	-- build = "cd app && yarn install && git restore .",
	init = function()
		vim.g.mkdp_filetypes = { "markdown", "vimwiki" }
		vim.g.mkdp_auto_close = 0
	end,
	ft = { "markdown" },
}
