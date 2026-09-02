vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.o.clipboard = 'unnamedplus'

vim.o.number = true
-- vim.o.relativenumber = true

vim.o.signcolumn = 'yes'

vim.o.tabstop = 4
vim.o.shiftwidth = 4

vim.o.updatetime = 300

vim.o.termguicolors = true

vim.o.mouse = 'a'

-- Diagnostics
vim.keymap.set('n', '<leader>q', vim.diagnostic.setqflist, {
  desc = 'Open diagnostics',
})

vim.keymap.set('n', '<leader>qc', function()
  vim.cmd('cclose')
end, {
  desc = 'Close diagnostics',
})

