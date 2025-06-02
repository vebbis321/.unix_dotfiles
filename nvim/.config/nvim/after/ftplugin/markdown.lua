local opt = vim.opt
opt.spell = false
opt.spelllang = { "en_us" }
opt.linebreak = true
opt.colorcolumn = "80"
opt.textwidth = 78
opt.conceallevel = 2

vim.diagnostic.enable(false)

-- spell
vim.keymap.set("n", "<leader>tg", function()
	vim.diagnostic.enable(not vim.diagnostic.is_enabled())
	vim.opt.spell = not (vim.opt.spell:get())
end)
