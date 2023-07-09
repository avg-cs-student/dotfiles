local M = {}
local opts = {}
opts.tabsize = 2

M.on_attach = require('lsp.servers.common').on_attach(opts)

return M
