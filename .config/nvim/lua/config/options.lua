-- Uses GUI colors in *supported* terminals.
vim.opt.termguicolors = true
-- Magically makes Neovim responsive.
vim.opt.updatetime = 50

-- Applies block cursor for very Vim mode.
vim.opt.guicursor = ""
-- Hides Vim modes display.
vim.opt.showmode = false

-- Splits horizontally below.
vim.opt.splitbelow = true
-- Splits vertically to the right.
vim.opt.splitright = true

-- Displays absolute line numbers.
vim.opt.number = true
-- NOTE: `true` for relative lines.
vim.opt.relativenumber = false
-- Always displays a single sign column.
vim.opt.signcolumn = "yes:1"

-- Indents using 2 spaces.
-- TODO: Override for some files.
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Enables advanced indentation.
vim.opt.smartindent = true
-- "Is this a new line, or the same one?"
vim.opt.wrap = false

-- Highlights during and after search.
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Syncs the clipboard between OS and Neovim.
-- HMMM: Not working in WSL2 (Ubuntu)...
vim.opt.clipboard = "unnamedplus"

-- Disables all kinds of history.
vim.opt.swapfile = false
vim.opt.backup = false
-- TODO: Leverage undo files. 
vim.opt.undofile = false
vim.opt.undodir = ""
