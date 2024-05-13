return {
	{
		-- Autocompletion
		'hrsh7th/nvim-cmp',
		dependencies = {
			'hrsh7th/cmp-nvim-lsp',
		},
	},

	-- LSP Servers
	{ 'tsserver' },
	{ 'rust-analyzer' },

	-- Colors
	{ 'EdenEast/nightfox.nvim' },
	{
		-- LSP Configuration and Plugins
		'neovim/nvim-lspconfig',
		dependencies = {
			-- Automatically install LSPs to stdpath for nvim
			{ 'williamboman/mason.nvim', config = true },
			'williamboman/mason-lspconfig.nvim',

			-- Useful status updates for LSP
			-- Note: `opts = {}` is the same as calling `require('fidget').setup({})`
			{ 'j-hu/fidget.nvim',        tag = 'legacy', opts = {} },

			-- Additional lua configuration
			'folke/neodev.nvim',
		},
	},
	{
		'nvim-telescope/telescope.nvim',
		dependencies = { 'nvim-lua/plenary.nvim' },
	},
	{
		-- Adds git related signs to the gutter, as well as utilities for managing changes
		'lewis6991/gitsigns.nvim',
		opts = {
			signs                             = {
				add          = { text = '┃' },
				change       = { text = '┃' },
				delete       = { text = '_' },
				topdelete    = { text = '‾' },
				changedelete = { text = '~' },
				untracked    = { text = '┆' },
			},
			signcolumn                        = true, -- Toggle with `:Gitsigns toggle_signs`
			numhl                             = false, -- Toggle with `:Gitsigns toggle_numhl`
			linehl                            = false, -- Toggle with `:Gitsigns toggle_linehl`
			word_diff                         = false, -- Toggle with `:Gitsigns toggle_word_diff`
			watch_gitdir                      = {
				follow_files = true
			},
			auto_attach                       = true,
			attach_to_untracked               = false,
			current_line_blame                = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
			current_line_blame_opts           = {
				virt_text = true,
				virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
				delay = 1000,
				ignore_whitespace = false,
				virt_text_priority = 100,
			},
			current_line_blame_formatter      = '<author>, <author_time:%Y-%m-%d> - <summary>',
			current_line_blame_formatter_opts = {
				relative_time = false,
			},
			sign_priority                     = 6,
			update_debounce                   = 100,
			status_formatter                  = nil, -- Use default
			max_file_length                   = 40000, -- Disable if file is longer than this (in lines)
			preview_config                    = {
				-- Options passed to nvim_open_win
				border = 'single',
				style = 'minimal',
				relative = 'cursor',
				row = 0,
				col = 1
			},
			on_attach                         = function(bufnr)
				vim.keymap.set('n', '<leader>gp', require('gitsigns').prev_hunk,
					{ buffer = bufnr, desc = '[G]o to [P]revious Hunk' })
				vim.keymap.set('n', '<leader>gn', require('gitsigns').next_hunk,
					{ buffer = bufnr, desc = '[G]o to [N]revious Hunk' })
				vim.keymap.set('n', '<leader>ph', require('gitsigns').preview_hunk,
					{ buffer = bufnr, desc = '[P]review [H]unk' })
			end,
		},
	},
	{
		'nvim-telescope/telescope-fzf-native.nvim',
		build = 'make',
		cond = function()
			return vim.fn.executable 'make' == 1
		end,
	},
	-- 'gc' to comment visual regions/lines
	{ 'numToStr/Comment.nvim', opts = {} },
	-- git
	'tpope/vim-fugitive',
	-- automatic shiftwidth detection
	'tpope/vim-sleuth',
}
