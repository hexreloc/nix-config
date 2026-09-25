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

vim.opt.conceallevel = 2

vim.opt.wrap = true
vim.opt.breakindent = true

-- Diagnostics
vim.keymap.set('n', '<leader>q', vim.diagnostic.setqflist, {
  desc = 'Open diagnostics',
})

vim.keymap.set('n', '<C-n>', function()
  vim.cmd('Ntree')
end, {
  desc = 'Open Ntree',
})

vim.keymap.set('n', '<leader>qc', function()
  vim.cmd('cclose')
end, {
  desc = 'Close diagnostics',
})

-- Move lines
vim.keymap.set('n', '<S-Up>', ':m-2<CR>', {
  desc = 'Move line up',
})

vim.keymap.set('n', '<S-Down>', ':m+<CR>', {
  desc = 'Move line down',
})

vim.keymap.set('i', '<S-Up>', '<Esc>:m-2<CR>a', {
  desc = 'Move line up',
})

vim.keymap.set('i', '<S-Down>', '<Esc>:m+<CR>a', {
  desc = 'Move line down',
})

-- Move selected lines
vim.keymap.set('v', '<S-Up>', ":m '<-2<CR>gv=gv", {
  desc = 'Move selection up',
})

vim.keymap.set('v', '<S-Down>', ":m '>+1<CR>gv=gv", {
  desc = 'Move selection down',
})

-- Highlight yanked text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight yanked text',
  group = vim.api.nvim_create_augroup('YankHighlight', {
    clear = true,
  }),
  callback = function()
    vim.highlight.on_yank({
      higroup = 'IncSearch',
      timeout = 200,
    })
  end,
})

vim.cmd([[
  highlight Normal       guibg=#000000 guifg=#bcbcbc
  highlight NormalFloat  guibg=#000000 guifg=#bcbcbc
  highlight CursorLine   guibg=#111111
  highlight LineNr       guifg=#555555
  highlight CursorLineNr guifg=#ffffff
  highlight Comment      guifg=#666666
  highlight String       guifg=#55aa55
  highlight Function     guifg=#55aaaa
  highlight Keyword      guifg=#cc55cc
  highlight Type         guifg=#cdcd55
  highlight Constant     guifg=#5555cc
  highlight Number       guifg=#cc5555
  highlight Identifier   guifg=#bcbcbc
  highlight Statement    guifg=#cc5555
  highlight Visual       guibg=#333333
  highlight StatusLine   guibg=#111111 guifg=#bcbcbc
  highlight VertSplit    guifg=#222222
  highlight Pmenu        guibg=#111111 guifg=#bcbcbc
  highlight PmenuSel     guibg=#333333 guifg=#ffffff
]])
