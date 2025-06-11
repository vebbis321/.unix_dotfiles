vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

-- back to netrw
keymap.set("n", "<leader>jf", vim.cmd.Ex)

-- jump to previous file
keymap.set("n", "<C-b>", "<C-^>")

-- switching between buffers
keymap.set("n", "<c-j>", "<c-w><c-j>")
keymap.set("n", "<c-k>", "<c-w><c-k>")
keymap.set("n", "<c-l>", "<c-w><c-l>")
keymap.set("n", "<c-h>", "<c-w><c-h>")

-- quickfix
keymap.set("n", "<M-j>", ":cnext<CR>")
keymap.set("n", "<M-k>", ":cprev<CR>")
keymap.set("n", "<M-d>", function()
	vim.diagnostic.setqflist({ open = true })
end, { desc = "Quickfix: current buffer diagnostics" })

-- let cursor stay in place after paste
keymap.set("n", "J", "mzJ`z")

-- let cursor stay in the middle when jumping half-pages
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

-- let cursor stay in the middle when searching
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- move blocks of code
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- find and replace all text
keymap.set("n", "<leader>cs", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- paste over
keymap.set("x", "<leader>p", [["_dP]])

-- nope
keymap.set("n", "Q", "<nop>")
keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
