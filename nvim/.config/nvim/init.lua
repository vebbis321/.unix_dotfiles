require("config")

vim.lsp.enable({
	"lua_ls",
	"basedpyright",
	"marksman",
	"harper_ls",
})

vim.diagnostic.config({
	virtual_text = true,
})
