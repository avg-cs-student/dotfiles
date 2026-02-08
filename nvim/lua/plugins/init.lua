return {
	{
		'nvim-telescope/telescope-fzf-native.nvim',
		build = 'make',
		cond = function()
			return vim.fn.executable 'make' == 1
		end,
	},
	{ "blazkowolf/gruber-darker.nvim" },
	-- 'gc' to comment visual regions/lines.
	{ 'numToStr/Comment.nvim',   opts = {} },
	-- git
	'tpope/vim-fugitive',
	-- Automatic shiftwidth detection.
	'tpope/vim-sleuth',
	-- Asynchronus runner, auto populates qf list.
	'tpope/vim-dispatch',
	-- Transparency is pretty sweet
	-- 'tribela/transparent.nvim',
	{ 'williamboman/mason.nvim', config = true },
	'williamboman/mason-lspconfig.nvim',

	-- Add completion features
	'hrsh7th/nvim-cmp',
	'hrsh7th/cmp-nvim-lsp',
}
