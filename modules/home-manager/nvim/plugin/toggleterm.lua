local  term = require('toggleterm')
term.setup({
	direction = "tab",
})

vim.keymap.set("n", "<C-t>", "<cmd>ToggleTerm<CR>", {
  noremap = true,
  silent = true,
})

vim.keymap.set("t", "<C-t>", [[<C-\><C-n><cmd>ToggleTerm<CR>]], {
  noremap = true,
  silent = true,
})

