" Justin Cromer
" Wed May 24 11:14:45 AM EDT 2023

" Visual
colorscheme papercolor
set background=dark

set nu
set rnu
set nowrap		
set ruler
set colorcolumn=80
set scrolloff=3		" keep 3 lines visible above/below cursor when scrolling
set sidescrolloff=7	" same as above except for side scrolling
set visualbell		" no annoying sounds
set hidden		" save buffer information when it's not in view
set showcmd		" show current command in status
set wildmenu
set smartindent
set smarttab
set autoindent
set ignorecase smartcase
set cb=unnamedplus	" integrates system clipboard with yank and put

" https://shapeshed.com/vim-statuslines/
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
set statusline+=\ %f
set statusline+=%m\ 
set statusline+=%#GitColor#
set statusline+=%{StatuslineGit()} 
set statusline+=%#StatusLineNc#
set statusline+=%=
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
