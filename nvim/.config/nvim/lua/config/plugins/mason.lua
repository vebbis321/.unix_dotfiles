return {
    "mason-org/mason.nvim",
    dependencies = {
        "stevearc/conform.nvim",
        "mason-org/mason-lspconfig.nvim",
    },
    config = function()
        local mason = require("mason").setup {}
        local mason_lsp = require("mason-lspconfig").setup {}
    end
}

