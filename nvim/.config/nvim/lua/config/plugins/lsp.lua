return {
    "mason-org/mason.nvim",
    dependencies = {
        "stevearc/conform.nvim",
        "mason-org/mason-lspconfig.nvim",
    },
    config = function()
        local mason = require("mason").setup {}
        local mason_lsp = require("mason-lspconfig").setup { 
            automatic_enable = false -- I do this myself
        }

        -- lua_ls
        vim.lsp.config["luals"] = {
            cmd = {'lua-language-server'},
            filetypes = {'lua'},
            root_markers = { { '.luarc.json', '.luarc.jsonc' }, '.git' },
            settings = {
                Lua = {
                    runtime = {
                        version = 'LuaJIT',
                    }
                }
            }
        }

        vim.lsp.enable ({
            "luals",
        })
            

        local x = 2
        print(x)

    end
}
