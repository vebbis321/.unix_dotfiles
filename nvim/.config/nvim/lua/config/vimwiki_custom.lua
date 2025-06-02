local function file_exists(path)
	return vim.loop.fs_stat(path) ~= nil
end

local function handle_file(path)
	local file, err = io.open(path, "r")
	if not file then
		print("Failed to open file: " .. err)
		return nil
	end
	return file
end

local function handle_create_file_with(path, template)
	local file, err = io.open(path, "w")
	if file then
		print("File created: " .. path)
		if template ~= nil then
			file:write(template)
		end
		file:close()
	else
		print("Failed to create file: " .. err)
	end
end

local date = os.date("%Y-%m-%d")
local seperation = "\n\n"

local diary = function()
	local header = "# " .. date
	local todo = "## Todo:"
	local important = "## Important:"
	return header .. seperation .. todo .. seperation .. important
end

local recall = function()
	local header = "# " .. date
	local physics = "## Physics:"
	local maths = "## Math:"
	local programming = "## Programming:"
	return header .. seperation .. physics .. seperation .. maths .. seperation .. programming
end

local today_config = {
	diary = { template = diary(), path = "diary" },
	recall = { template = recall(), path = "recall" },
	scratchpad = { template = nil, path = "scratchpad" },
}

local M = {}

function M.open_today_with(config)
	local dir = vim.fn.expand("~") .. "/wiki/" .. config.path
	local filepath = dir .. "/" .. date .. ".md"

	if file_exists(filepath) then
		handle_file(filepath)
	else
		handle_create_file_with(filepath, config.template)
	end

	vim.cmd("edit " .. filepath)
end

vim.api.nvim_create_user_command("Diary", function()
	M.open_today_with(today_config.diary)
end, {})

vim.api.nvim_create_user_command("Recall", function()
	M.open_today_with(today_config.recall)
end, {})

vim.api.nvim_create_user_command("Scratchpad", function()
	M.open_today_with(today_config.scratchpad)
end, {})

vim.api.nvim_set_keymap("n", "<Leader>rc", ":Recall<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>sp", ":Scratchpad<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>w<leader>w", ":Diary<CR>", { noremap = true, silent = true })

return M
