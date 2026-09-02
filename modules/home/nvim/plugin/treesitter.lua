require('nvim-treesitter').setup {
  install_dir = vim.fn.stdpath('data') .. '/site',
}


-- Start Treesitter for supported filetypes.
vim.api.nvim_create_autocmd('FileType', {
  callback = function(args)
    pcall(vim.treesitter.start, args.buf)
  end,
})

