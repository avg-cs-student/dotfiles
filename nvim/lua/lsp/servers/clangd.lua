local M = {}

local opts = {}
opts.tabsize = 4

M.on_attach = require('lsp.servers.common').on_attach(opts)
M.root_dir = require('lspconfig').util.root_pattern(
  '.clangd',
  '.clang-tidy',
  '.clang-format',
  'compile_commands.json',
  'compile_flags.txt',
  'configure.ac',
  '.git'
)

return M
