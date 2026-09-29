local leetcode = require("leetcode")

leetcode.setup({
	storage = {
		home = vim.fn.stdpath("data") .. "/leetcode",
	},
})

vim.keymap.set("n", "<leader>lc", "<cmd>Leet console<CR>", {
	desc = "Open LeetCode console",
})
