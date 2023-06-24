-- Native LSP Setup (HOW TO)
-- First, get LSP server -> add to path
-- Then, customize like so


-- Lua Language Server (sumneko_ls -> lua_ls)
require('lspconfig').lua_ls.setup {
	on_attach = function()
		vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
		vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { buffer = 0 })
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = 0 })
		vim.keymap.set("n", "gn", vim.diagnostic.goto_next, { buffer = 0 })
		vim.keymap.set("n", "<leader>F", vim.lsp.buf.format, { buffer = 0 })
		vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { buffer = 0 })
		vim.opt.ts = 2
	end,
	-- These are specific to the LSP server
	settings = {
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
}
