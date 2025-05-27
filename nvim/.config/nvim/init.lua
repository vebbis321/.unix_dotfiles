require("config")

vim.lsp.enable({
    "luals",
    "basedpyright",
})
vim.diagnostic.config({
    virtual_text = true,
})
