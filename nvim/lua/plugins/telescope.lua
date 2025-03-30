return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    "nvim-telescope/telescope-file-browser.nvim",
  },
  config = function()
    -- :help telescope.builtin
    local builtin = require('telescope.builtin')
    require('telescope').setup({
      defaults = {
        mappings = {
          n = {
            ['<C-q>'] = require('telescope.actions').smart_send_to_qflist,
          },
          i = {
            ['<C-u>'] = false,
            ['<C-d>'] = false,
          },
        },
      },
      extensions = {
        file_browser = {
          dir_icon = "🗀",
        },
      },
    })

    pcall(require('telescope').load_extension, 'fzf')
    vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
    vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
    vim.keymap.set('n', '<leader>sh', builtin.help_tags, {})
    vim.keymap.set('n', '<leader>?', builtin.oldfiles, {})
    vim.keymap.set('n', '<leader>sg', builtin.live_grep, {})
    vim.keymap.set('n', '<leader><space>', builtin.buffers, {})
    vim.keymap.set('n', '<leader>/', function()
      builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end, {})
  end,
}
