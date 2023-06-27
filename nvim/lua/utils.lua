-- Allows use of `:lua P(<some-table>)` to inspect tables from nvim
P = function(tbl)
		print(vim.inspect(tbl))
		return tbl
end

