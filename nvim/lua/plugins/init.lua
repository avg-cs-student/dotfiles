return {
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
	-- asynchronus runner, auto populates qf list
	'tpope/vim-dispatch',
}
