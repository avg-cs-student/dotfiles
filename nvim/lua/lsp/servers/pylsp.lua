local M = {}

local opts = {}
opts.tabsize = 4

M.on_attach = require('lsp.servers.common').on_attach(opts)
return M
