vim.keymap.set("n", "<leader>n", "<cmd>NERDTreeFocus<CR>", {
	desc = "NERDTree focus",
})

vim.keymap.set("n", "<C-n>", "<cmd>NERDTreeToggle<CR>", {
	desc = "NERDTree toggle",
})

vim.keymap.set("n", "<C-f>", "<cmd>NERDTreeFind<CR>", {
	desc = "NERDTree find",
})

vim.keymap.set("n", "<leader>tc", ":tabclose<CR>", {
	desc = "Close tab",
})

vim.keymap.set("n", "<leader>to", ":tabonly<CR>", {
	desc = "Close other tabs",
})

vim.keymap.set("n", "<leader>tn", ":tabnew<CR>", {
	desc = "New tab",
})
