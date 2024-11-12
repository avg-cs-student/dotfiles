local opt = vim.opt

-- Indentation
opt.shiftwidth = 4
opt.softtabstop = 4
opt.tabstop = 4
opt.expandtab = true
opt.smartindent = true
opt.breakindent = true

-- Appearance
opt.number = true
opt.relativenumber = true
opt.splitright = true
opt.splitbelow = true
opt.termguicolors = true
opt.colorcolumn = '80'
opt.signcolumn = 'yes'
opt.background = 'dark'

-- Search
opt.ignorecase = true
opt.incsearch = true
opt.smartcase = true
opt.hlsearch = false
opt.path:append('**')

-- -- Highlight on yank (:help vim.highlight.on_yank())
-- local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true})
-- vim.api.nvim_create_autocmd('TextYankPost', {
-- 	callback = function()
-- 		vim.highlight.on_yank()
-- 	end,
-- 	group = highlight_group,
-- 	pattern = '*',
-- })

-- Misc
opt.hidden = true
opt.undofile = true
opt.wildmode = 'longest,list'
opt.mouse = 'a'
