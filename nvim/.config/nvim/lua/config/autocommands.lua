vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight on yank",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- auto sync file changes
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "VimResume", "CursorHold" }, {
	pattern = "*",
	command = "silent! checktime",
})

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		-- vim.keymap.set("n", "ge", vim.diagnostic.open_float() , buffer = {0})
	end,
})
