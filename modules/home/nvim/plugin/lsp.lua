local on_attach = function(_, bufnr)
  local bufmap = function(keys, func)
    vim.keymap.set('n', keys, func, {
      buffer = bufnr,
    })
  end

  -- Rename
  bufmap('<leader>r', vim.lsp.buf.rename)

  -- Code actions
  bufmap('<leader>a', vim.lsp.buf.code_action)

  -- Navigation
  bufmap('gd', vim.lsp.buf.definition)
  bufmap('gD', vim.lsp.buf.declaration)
  bufmap('gI', vim.lsp.buf.implementation)
  bufmap('<leader>D', vim.lsp.buf.type_definition)

  -- Telescope LSP
  bufmap('gr', require('telescope.builtin').lsp_references)
  bufmap('<leader>s', require('telescope.builtin').lsp_document_symbols)
  bufmap(
    '<leader>S',
    require('telescope.builtin').lsp_dynamic_workspace_symbols
  )

  -- Hover documentation
  bufmap('K', vim.lsp.buf.hover)

  -- Formatting
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function()
    vim.lsp.buf.format()
  end, {})
end


-- Completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities = require('cmp_nvim_lsp').default_capabilities(
  capabilities
)


-- Neovim Lua development
require('neodev').setup()


-- Lua Language Server
vim.lsp.config('lua_ls', {
  on_attach = on_attach,
  capabilities = capabilities,

  cmd = {
    'lua-language-server',
  },

  root_markers = {
    '.luarc.json',
    '.luarc.jsonc',
    '.git',
  },

  settings = {
    Lua = {
      workspace = {
        checkThirdParty = false,
      },

      telemetry = {
        enable = false,
      },
    },
  },
})


-- Nix Language Server
vim.lsp.config('nixd', {
  on_attach = on_attach,
  capabilities = capabilities,
})

vim.lsp.config('clangd', {
  on_attach = on_attach,
  capabilities = capabilities,
})


-- Enable language servers
vim.lsp.enable({
  'lua_ls',
  'nixd',
  'clangd',
})

