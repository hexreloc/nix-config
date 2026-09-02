local nerdtree = require('nerdtree')

nerdtree:setup({})

vim.keymap.set("n", "<leader>n", function ()
	nerdtree:NERDTreeFocus()
end, {})

vim.keymap.set("n", "<C-n>", function ()
	nerdtree:NERDTreeToggle()
end, {})

vim.keymap.set("n", "<C-f>", function ()
	nerdtree:NERDTreeFind()
end, {})

