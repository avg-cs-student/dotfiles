vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- remove header spam
vim.g.netrw_banner = 0

-- tree view
vim.g.netrw_liststyle = 3

vim.cmd.colorscheme('retrobox')

-- quickly update nvim
vim.keymap.set('n', '<leader>ev', '<cmd>vsplit $MYVIMRC<cr>')
vim.keymap.set('n', '<leader>sv', '<cmd>source $MYVIMRC<cr>')
require('config')
