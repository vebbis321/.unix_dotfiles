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

-- auto reload diary and recall for new day and add headers
vim.api.nvim_create_autocmd("BufRead", {
	pattern = { "*/diary/*.md", "*/recall/*.md" },
	callback = function()
		local today = os.date("%Y-%m-%d")
		local diary_path = vim.fn.expand("~/wiki/diary/" .. today .. ".md")
		local recall_path = vim.fn.expand("~/wiki/recall/" .. today .. ".md")
		local current_path = vim.fn.expand("%:p")

		-- Function to check if a file is empty
		local function is_empty(file)
			local f = io.open(file, "r")
			if f then
				local content = f:read("*a")
				f:close()
				return content == ""
			end
			return true
		end

		-- If the opened file is outdated, switch to today's file
		if current_path:match("/diary/") and current_path ~= diary_path then
			vim.cmd("edit " .. diary_path)
		elseif current_path:match("/recall/") and current_path ~= recall_path then
			vim.cmd("edit " .. recall_path)
		end

		-- Insert headers if the file is new/empty
		if current_path == diary_path and is_empty(diary_path) then
			vim.fn.writefile({ "# Thoughts\n", "# Todos\n" }, diary_path)
		elseif current_path == recall_path and is_empty(recall_path) then
			vim.fn.writefile({ "# Fysikk\n", "# Matte\n" }, recall_path)
		end
	end,
})
