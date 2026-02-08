vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- remove header spam
vim.g.netrw_banner = 0

-- tree view
vim.g.netrw_liststyle = 3

require('config')
vim.cmd.colorscheme('gruber-darker')

-- LSP
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

vim.lsp.enable({
	"clangd",
	"lua_ls",
	"rust_analyzer",
	"ty",
})
