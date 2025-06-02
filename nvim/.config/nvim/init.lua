require("config")

vim.lsp.enable({
	"luals",
	"basedpyright",
	"marksman",
})

vim.diagnostic.config({
	virtual_text = true,
})
