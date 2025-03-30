-- LSP Setup

-- Use LspAttach autocmd to only map the following keys
-- after the language server attaches to the current buffer.
vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('UserLspConfig', {}),
	callback = function(ev)
		--Enable omnicompletion (<c-x><c-o>)
		vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

		-- Buffer local mappings. (:help vim.lsp.*)
		local opts = { buffer = ev.buf }
		vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
		vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
		vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
		vim.keymap.set('n', '<leader>f', function()
			vim.lsp.buf.format { async = true }
		end, opts)

		-- Suggested code action
		vim.keymap.set('n', '<leader>qf', function()
			vim.lsp.buf.code_action({
				filter = function(a) return a.isPreferred end,
				apply = true
			})
		end, { noremap = true, silent = true })
	end,
})

return {
	'neovim/nvim-lspconfig',
	dependencies = {
		{ 'williamboman/mason.nvim', config = true },
		'williamboman/mason-lspconfig.nvim',
		{ 'j-hui/fidget.nvim',       tag = 'legacy', opts = {} },
		'folke/neodev.nvim',

		-- Add completion features
		'hrsh7th/nvim-cmp',
		'hrsh7th/cmp-nvim-lsp',
	},
	config = function()
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend(
			'force',
			capabilities,
			require('cmp_nvim_lsp').default_capabilities()
		)

		require('mason').setup()
		require('mason-lspconfig').setup({
			handlers = {
				-- Optional default handler
				function(server_name)
					require('lspconfig')[server_name].setup({
						capabilities = capabilities,
					})
				end, -- end default

				['lua_ls'] = function()
					local lspconfig = require('lspconfig')
					lspconfig.lua_ls.setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								runtime = { version = '5.4' },
								diagnostics = {
									globals = {
										'vim',
										'it',
										'describe',
										'before_each',
										'after_each'
									}
								}
							}
						}
					})
					lspconfig.rust_analyzer.setup({
						capabilities = capabilities,
						settings = {
							['rust_analyzer'] = {
								imports = {
									granularity = {
										group = 'module',
									},
									prefix = 'self',
								},
								cargo = {
									buildScripts = {
										enable = true,
									},
								},
								procMacro = {
									enable = true,
								},
							}
						}
					})
				end,
			}
		})
		vim.diagnostic.config({
			float = {
				focusable = false,
				style = 'minimal',
				border = 'rounded',
				source = 'always',
				header = '',
				prefix = '',
			},
		})
	end, -- end config()
}
