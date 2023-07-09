-- Key shortcuts
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>pdf", "<cmd>!pdflatex % && open *.pdf<cr>")
