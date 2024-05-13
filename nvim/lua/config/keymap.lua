local key = vim.keymap

key.set({'n','v'}, '<Space>', '<Nop>', {silent = true})

-- diagnostics
key.set('n', '[d', vim.diagnostic.goto_prev, {desc = 'Go to previous diagnostic message.'})
key.set('n', ']d', vim.diagnostic.goto_next, {desc = 'Go to next diagnostic message.'})
key.set('n', '<leader>e', vim.diagnostic.open_float, {desc = 'Open floating diagnostic message.'})
key.set('n', '<leader>q', vim.diagnostic.setloclist, {desc = 'Open diagnostics list.'})
