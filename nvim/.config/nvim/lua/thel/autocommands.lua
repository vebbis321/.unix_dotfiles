-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- auto sync file changes
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "VimResume", "CursorHold" }, {
	pattern = "*",
	command = "silent! checktime",
})

-- Autocommand to add headers for daily notes
vim.api.nvim_create_augroup("DailyNotes", { clear = true })
vim.api.nvim_create_autocmd("BufNewFile", {
	group = "DailyNotes",
	pattern = "~/wiki/daily_notes_*.md",
	callback = function()
		-- Always add the headers to the newly created file
		vim.fn.append(0, "# Thoughts:")
		vim.fn.append(1, "# Todos:")
		vim.cmd("write") -- Save the file after adding headers
	end,
})
