-- Imports CodonadeKeymap.
local nap = require("codonade.keymap").nap
local map = require("codonade.keymap").map

-- Sets <Leader> key to <Space>
vim.g.mapleader = " "
vim.g.mapleaderlocal = " "

-- Splits horizontally (above or below).
nap("<Leader>wh", "<C-w>s", "Split: Horizontal")
-- Splits vertically (left or right).
nap("<Leader>wv", "<C-w>v", "Split: Verticallly")

-- Goes to the split above.
nap("<C-k>", "<C-w>k", "Split: Go Above")
-- Goes to the split below.
nap("<C-j>", "<C-w>j", "Split: Go Below")
-- Goes to the left split.
nap("<C-h>", "<C-w>h", "Split: Go Left")
-- Goes to the right split.
nap("<C-l>", "<C-w>l", "Split: Go Right")

-- Closes the current split.
nap("<Leader>wq", "<C-w>c", "Split: Quit")
-- Closes all other splits.
nap("<Leader>wa", "<C-w>o", "Split: Quit All")

-- Navigates through buffers.
nap("<Leader><Tab>", ":bnext<Return>", "Buffer: Next")
-- HMMM: Why Neovim used `previous` hear, not `prev`?
nap("<Leader><S-Tab>", ":bprevious<Return>", "Buffer: Prev")
-- Delets the current buffer.
nap("<Leader>bd", ":bd<Return>", "Buffer: Delete")

-- Goes to the end of the line.
nap("E", "$", "Line: Goto End")
-- Highlights to the end of the line.
nap("<C-E>", "v$", "Line: Select to End")
-- Goes to the start of the line.
nap("B", "^", "Line: Goto Start")
-- Highlights to the start of the line.
nap("<C-B>", "v^", "Line: Select to Start")

-- Moves current line above, and indents it.
nap("<A-j>", ":m .+1<Return>==", "Line: Move down" )
-- Moves current line below, and indents it.
nap("<A-k>", ":m .-2<Return>==", "Line: Move up")

-- Pastes without copying selection to register.
map("x", "<Leader>p", '"_dP', "Paste (_)")
-- Deletes without copying to register.
map("nx", "<Leader>d", '"_d', "Delete (_)")
-- Crops without copying to register.
map("nx", "<Leader>c", '"_c', "Crop (_)")
-- Crops to end of line without copying to register.
map("n", "<Leader>C", '"_C', "Line: Crop to End (_)")
-- Crops line without copying to register.
map("n", "<Leader>S", '"_S', "Line: Crop (_)")
-- Deletes character without copying to register.
map("nx", "<Leader>x", '"_x', "Character: Delete (_)")
-- Deletes previous character without copying to register.
map("n", "<Leader>X", '"_X', "Character: Delete Prev (_)")
-- Crops character without copying to register.
map("nx", "<Leader>s", '"_s', "Character: Crop (_)")

-- Selects the whole file.
nap("<C-a>", "ggVG$h", "File: Select")
-- Indents the whole file.
nap("<C-i>", "ggVG=G$", "File: Indent")

-- Re-does a previous action.
nap("U", ":redo<Return>", "Redo")
-- WARN: Deletes <C-r> keymap.
nap("<C-r>", "<Nop>", "")

-- Navigates through search results.
nap("n", "N", "Result: Next")
nap("N", "n", "Result: Prev")

-- Displays LSP diagnostics for current line.
nap("D", vim.diagnostic.open_float, "Line: Diagnostics")
-- Navigates through LSP diagnostics.
nap("]d", vim.diagnostic.goto_next, "Diagnostics: Next")
nap("[d", vim.diagnostic.goto_prev, "Diagnostics: Prev")
