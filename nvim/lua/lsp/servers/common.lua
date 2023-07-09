-- Common settings across all LSP servers
local M = {}

M.on_attach = function(opts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = 0 })
	vim.keymap.set("n", "gn", vim.diagnostic.goto_next, { buffer = 0 })
	vim.keymap.set("n", "<leader>F", vim.lsp.buf.format, { buffer = 0 })
	vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { buffer = 0 })
	vim.opt.ts = opts.tabsize
	vim.opt.sts = opts.tabsize
	vim.opt.sw = opts.tabsize
end

return M
