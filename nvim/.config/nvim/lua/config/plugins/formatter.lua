return {
    "stevearc/conform.nvim",
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                python = { "ruff_format" },
                lua = { "stylua" },
            },
            format_on_save = {
                -- These options will be passed to conform.format()
                timeout_ms = 500,
                lsp_format = "fallback",
            },
        })
    end,
}
