return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	config = function()
		local telescope = require("telescope")
		telescope.load_extension("fzf")
		local builtin = require("telescope.builtin")

		local key = vim.keymap
		key.set("n", "<space>ff", builtin.find_files)
		key.set("n", "<space>fh", builtin.help_tags)
		key.set("n", "<space>fs", builtin.live_grep)
		key.set("n", "<space>fd", builtin.diagnostics)

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
