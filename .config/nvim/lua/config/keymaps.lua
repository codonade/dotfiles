-- Sets <Leader> key to <Space>
vim.g.mapleader = " "
vim.g.mapleaderlocal = " "

-- Navigates through buffers.
vim.keymap.set("n", "<Tab>", ":bnext<Return>")
-- HMMM: What Neovim used `previous` hear, not `prev`?
vim.keymap.set("n", "<S-Tab>", ":bprevious<Return>")
-- Delets the current buffer.
vim.keymap.set("n", "<Leader>bd", ":bd<Return>", {
  desc = "[B]uffer: [D]elete",
})

-- Goes to the end of the line.
vim.keymap.set("n", "E", "$")
-- Highlights to the end of the line.
vim.keymap.set("n", "<C-E>", "v$")
-- Goes to the beginning of the line.
vim.keymap.set("n", "B", "^")
-- Highlights to the beginning of the line.
vim.keymap.set("n", "<C-B>", "v^")

-- Selects the whole file.
vim.keymap.set("n", "<C-a>", "ggVG$h")
-- Indents the whole file.
vim.keymap.set("n", "<C-i>", "ggVG$h=G$")

-- Removes search highlights.
vim.keymap.set("n", "<Esc>", ":nohlsearch<Return>")
-- Navigates through search results.
vim.keymap.set("n", "n", "N")
vim.keymap.set("n", "N", "n")

-- Displays LSP diagnostics for current line.
vim.keymap.set("n", "D", vim.diagnostic.open_float)
-- Navigates through LSP diagnostics.
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
