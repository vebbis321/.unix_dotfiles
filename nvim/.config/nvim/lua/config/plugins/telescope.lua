return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local builtin = require("telescope.builtin")

		telescope.load_extension("fzf")
		telescope.setup({
			pickers = {
				live_grep = {
					file_ignore_patterns = { "node_modules", ".git", ".venv", ".DS_Store" },
					hidden = true,
				},
				find_files = {
					file_ignore_patterns = { "node_modules", ".git", ".venv", ".DS_Store" },
					hidden = true,
				},
			},
			extensions = {
				"fzf",
			},
			defaults = require("telescope.themes").get_dropdown({
				path_display = { "truncate " },
				layout_config = {
					anchor = "N",
					width = 99,
				},
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
				},
			}),
		})

		local key = vim.keymap
		key.set("n", "<space>ff", builtin.find_files)
		key.set("n", "<space>fh", builtin.help_tags)
		key.set("n", "<space>fs", builtin.live_grep)
		key.set("n", "<space>fd", builtin.diagnostics)
		key.set("n", "<space>fm", builtin.man_pages)

		key.set("n", "<space>fr", function()
			builtin.find_files({ cwd = "~/repos/", prompt_title = "repos" })
		end)
		key.set("n", "<space>fc", function()
			builtin.find_files({ cwd = "~/code/", prompt_title = "code" })
		end)
		key.set("n", "<space>fn", function()
			builtin.find_files({ cwd = "~/notes/", prompt_title = "notes" })
		end)
	end,
}
