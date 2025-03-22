vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- remove header spam
vim.g.netrw_banner = 0

-- tree view
vim.g.netrw_liststyle = 3

require('config')
vim.cmd.colorscheme('default')

-- quickly update nvim
vim.keymap.set('n', '<leader>ev', '<cmd>10split $MYVIMRC<cr>')
vim.keymap.set('n', '<leader>sv', '<cmd>source $MYVIMRC<cr>')

vim.keymap.set('n', '<leader>l', '<C-^>')
vim.keymap.set('n', '<leader>tn', '<cmd>tabnew<cr>')
