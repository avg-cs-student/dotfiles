-- Native LSP Setup (HOW TO)
-- First, get LSP server -> add to path
-- Then, customize like so

local lspconfig = require('lspconfig')
local servers = {
	clangd = require('lsp.servers.clangd'),
	lua_ls = require('lsp.servers.lua_ls'),
	pylsp = require('lsp.servers.pylsp'),
	texlab = require('lsp.servers.texlab'),
}

for server, opts in pairs(servers) do
	lspconfig[server].setup {
		on_attach = opts.on_attach,
		settings = opts.settings,
	}
end
