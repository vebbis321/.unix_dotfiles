return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
    config = function()
        local telescope = require("telescope")
        local builtin = require("telescope.builtin")


        local key = vim.keymap
        key.set("n", "<space>ff", builtin.find_files)


    end
}
