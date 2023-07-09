require('plugins')
require('remap')
require('lsp.config')
require('utils')

-- 	Visual
vim.cmd.colorscheme('papercolor')
vim.opt.background 		= "dark"
vim.opt.scrolloff 		= 3	-- keep 3 lines visible when scrolling
vim.opt.sidescrolloff 	= 7	-- same as above except for side scrolling
vim.opt.colorcolumn 	= "80"
vim.opt.number 			= true
vim.opt.relativenumber	= true
vim.opt.wrap 			= false
vim.opt.ruler 			= true
vim.opt.visualbell		= true	-- no annoying sounds
vim.opt.hidden			= true	-- save buffer information when it's not in view
vim.opt.showcmd			= true	-- show current command in status
vim.opt.wildmenu		= true
vim.opt.smartindent		= true
vim.opt.smarttab		= true
vim.opt.autoindent		= true
vim.opt.ignorecase		= true
vim.opt.clipboard		= "unnamedplus"	-- integrates system clipboard
vim.opt.breakindent = true
vim.o.completeopt	= 'menuone,noselect'

-- 	Markdown
vim.cmd([[
	au Filetype markdown set wrap
	au Filetype markdown set spell
	au Filetype markdown set textwidth=80
	au Filetype markdown set noexpandtab
]])

-- Latex
vim.cmd([[
	au Filetype tex set wrap
	au Filetype tex set spell
	au Filetype tex set textwidth=80
	au Filetype tex set noexpandtab
]])


--[[ 	
--	The following lines customize the status bar at the bottom of the screen
--	ref: https://shapeshed.com/vim-statuslines/
--]]

vim.cmd([[
	function! GitBranch()
	  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
	endfunction

	function! StatuslineGit()
	  let l:branchname = GitBranch()
	  return strlen(l:branchname) > 0?' '.l:branchname.' ':''
	endfunction

	hi NormalColor ctermbg=darkgrey ctermfg=white
	hi CommandColor ctermbg=lightgrey ctermfg=black
	hi InsertColor ctermbg=darkgreen ctermfg=black
	hi ReplaceColor ctermbg=darkred ctermfg=white
	hi VisualColor  ctermbg=blue ctermfg=black
	hi GitColor ctermbg=202 ctermfg=white

	set laststatus=2
	set statusline=
	set statusline+=%#NormalColor#%{(mode()=='n')?'\ \ NORMAL\ ':''}
	set statusline+=%#CommandColor#%{(mode()=='c')?'\ \ COMMAND\ ':''}
	set statusline+=%#InsertColor#%{(mode()=='i')?'\ \ INSERT\ ':''}
	set statusline+=%#ReplaceColor#%{(mode()=='R')?'\ \ REPLACE\ ':''}
	set statusline+=%#VisualColor#%{(mode()=='v')?'\ \ VISUAL\ ':''}
	set statusline+=%#StatusLineNc#
	set statusline+=\ \ \ \ \ \ \ %r\ %f 
	set statusline+=\ \ \ \ \ \ \ \ 
	set statusline+=%#GitColor#
	set statusline+=%m\ %{StatuslineGit()}\  
	set statusline+=%#StatusLineNc#
	set statusline+=%=
	set statusline+=\ %y
	set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
	set statusline+=\[%{&fileformat}\]
	set statusline+=\ %p%%
	set statusline+=\ %l:%c
]])
