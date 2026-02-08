local key = vim.keymap

key.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Diagnostic Config
-- See :help vim.diagnostic.Opts
vim.diagnostic.config {
	severity_sort = true,
	float = { border = 'rounded', source = 'if_many' },
	underline = { severity = vim.diagnostic.severity.ERROR },
	virtual_text = {
		source = 'if_many',
		spacing = 2,
		format = function(diagnostic)
			local diagnostic_message = {
				[vim.diagnostic.severity.ERROR] = diagnostic.message,
				[vim.diagnostic.severity.WARN] = diagnostic.message,
				[vim.diagnostic.severity.INFO] = diagnostic.message,
				[vim.diagnostic.severity.HINT] = diagnostic.message,
			}
			return diagnostic_message[diagnostic.severity]
		end,
	},
}

-- quickly update nvim
vim.keymap.set('n', '<leader>ev', '<cmd>tabnew $MYVIMRC<cr>')
vim.keymap.set('n', '<leader>sv', '<cmd>source $MYVIMRC<cr>')

-- hop to previous buffer
vim.keymap.set('n', '<leader>l', '<C-^>')

-- tabs
vim.keymap.set('n', '<leader>tn', '<cmd>tabnew<cr>')
key.set('n', '<leader>0', ':0tabn<CR>', { desc = 'Go to Tab 0.' })
key.set('n', '<leader>1', ':1tabn<CR>', { desc = 'Go to Tab 1.' })
key.set('n', '<leader>2', ':2tabn<CR>', { desc = 'Go to Tab 2.' })
key.set('n', '<leader>3', ':3tabn<CR>', { desc = 'Go to Tab 3.' })
key.set('n', '<leader>4', ':4tabn<CR>', { desc = 'Go to Tab 4.' })
key.set('n', '<leader>5', ':5tabn<CR>', { desc = 'Go to Tab 5.' })

-- diagnostics
key.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message.' })
key.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message.' })
key.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message.' })
key.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list.' })

-- Quick save
key.set('n', '<leader>w', "<cmd>write<CR>", { desc = 'Save file.' })

-- Execute a code action, usually your cursor needs to be on top of an error
-- or a suggestion from your LSP for this to activate.
key.set({ 'n', 'x' }, '<leader>ca', vim.lsp.buf.code_action, { desc = '[C]ode [A]ction' })

-- File browser
key.set("n", "<leader>fl", ":Telescope file_browser path=%:p:h select_buffer=true<CR>")

-- Diagnostic keymaps
key.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Quickly toggle hlsearch
key.set('n', '<leader>hl', function()
		vim.o.hlsearch = not vim.o.hlsearch
	end,
	{ desc = 'Toggle hilighting on search' }
)
