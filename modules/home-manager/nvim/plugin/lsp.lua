local on_attach = function(_, bufnr)
	local bufmap = function(keys, func)
		vim.keymap.set('n', keys, func, {
			buffer = bufnr,
		})
	end

	-- Rename
	bufmap('<leader>r', vim.lsp.buf.rename)

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
	'pyright',
})

vim.lsp.config('pyright', {
	on_attach = on_attach,
	capabilities = capabilities,
})


-- Keep diagnostics, but reduce visual noise.
vim.diagnostic.config({
    virtual_text = false,
    signs = false,
    underline = false,
    update_in_insert = false,
    severity_sort = true,
    float = {
        border = "rounded",
        source = "if_many",
    },
})

-- Show diagnostic details only when requested.
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, {
    desc = "Show diagnostics",
})

vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, {
    desc = "Previous diagnostic",
})

vim.keymap.set("n", "]d", vim.diagnostic.goto_next, {
    desc = "Next diagnostic",
})

