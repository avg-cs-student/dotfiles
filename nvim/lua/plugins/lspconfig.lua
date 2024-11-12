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
		'hrsh7th/cmp-nvim-lsp',
		{ 'j-hui/fidget.nvim',       tag = 'legacy', opts = {} },
		'folke/neodev.nvim',

	},
	config = function()
		local cmp_lsp = require('cmp_nvim_lsp')
		local capabilities = vim.tbl_deep_extend(
			'force',
			{},
			vim.lsp.protocol.make_client_capabilities(),
			cmp_lsp.default_capabilities())
		require('mason').setup()
		require('mason-lspconfig').setup({
			ensure_installed = {
				'clangd',
				'dockerls',
				'gopls',
				'lua_ls',
				'rust_analyzer',
			},
			handlers = {
				-- Optional default handler
				function(server_name)
					require('lspconfig')[server_name].setup({
						capabilities = capabilities
					})
				end, -- end default
				['clangd'] = function()
					local lspconfig = require('lspconfig')
					lspconfig.clangd.setup({
						capabilities = capabilities,
						filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "hpp" },
					})
				end,
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
			virtual_text = false,
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
