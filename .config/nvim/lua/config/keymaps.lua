-- Sets <Leader> key to <Space>
vim.g.mapleader = " "
vim.g.mapleaderlocal = " "

-- Removes search highlights.
vim.keymap.set("n", "<Esc>", ":nohlsearch<Return>")
-- Navigates through search results.
vim.keymap.set("n", "n", "N")
vim.keymap.set("n", "N", "n")

-- Navigates through LSP diagnostics.
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
