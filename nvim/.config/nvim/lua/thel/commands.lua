local M = {}

function M.file_exists(path)
	return vim.loop.fs_stat(path) ~= nil
end

function M.handle_file(path)
	local file, err = io.open(path, "r")
	if not file then
		print("Failed to open file: " .. err)
		return nil
	end
	return file
end

function M.handle_create_file(path)
	local file, err = io.open(path, "w")
	if file then
		print("File created: " .. path)
		local subheader = "## Spørsmål\n\n## Forklar\n\n"
		local header = "# Fysikk:\n\n" .. subheader .. "# Matte:\n\n" .. subheader
		file:write(header)
		file:close()
	else
		print("Failed to create file: " .. err)
	end
end

function M.open_today_recall()
	local date = os.date("%Y-%m-%d")
	local dir = vim.fn.expand("~") .. "/wiki/recall"
	local filepath = dir .. "/" .. date .. ".md"

	if M.file_exists(filepath) then
		M.handle_file(filepath)
	else
		M.handle_create_file(filepath)
	end

	vim.cmd("edit " .. filepath)
end

vim.api.nvim_create_user_command("Recall", function()
	M.open_today_recall()
end, {})

vim.api.nvim_set_keymap("n", "<Leader>wrc", ":Recall<CR>", { noremap = true, silent = true })

return M
