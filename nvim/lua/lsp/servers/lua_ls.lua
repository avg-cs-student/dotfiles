-- LSP configuration for lua-language-server
local M = {}
local common = require('lsp.servers.common')

local opts = {}
opts.tabsize = 2

M.on_attach = common.on_attach(opts)
M.settings = {
	Lua = {
		completion = { enable = true, callSnippet = "Both" },
		format = {
			enable = true,
			defaultConfig = {
				indent_style = "space",
				indent_size = "2",
			}
		},
		workspace = {
			library = {
				[vim.fn.expand('$VIMRUNTIME/lua')] = true,
				[vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
				[vim.fn.expand('$PATH')] = true,
			},
		}
	}
}

return M
