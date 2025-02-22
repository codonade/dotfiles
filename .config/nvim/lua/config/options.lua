-- Use GUI colors in supported terminals.
vim.opt.termguicolors = true
-- Magically make Neovim responsive ;)
vim.opt.updatetime = 50

-- Apply block cursor for very Vim mode.
vim.opt.guicursor = ""
-- Hide Vim modes display.
vim.opt.showmode = false

-- Split horizontally below.
vim.opt.splitbelow = true
-- Split vertically to the right.
vim.opt.splitright = true

-- Disable absolute line numbers; Focus had its effects on me :)
vim.opt.number = false
-- Alway displays a single sign column.
vim.opt.signcolumn = "yes:1"

-- Indent using 2 spaces.
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Enable advanced indentation.
vim.opt.smartindent = true
-- Allow lines to exceed the screen width.
vim.opt.wrap = false

-- Cap the maximum length for `popupmenu`.
vim.opt.pumheight = 10

-- Highlight during and after search.
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Sync the clipboard between OS and Neovim.
-- HMMM: Not working in WSL2 (Ubuntu)...
vim.opt.clipboard = "unnamedplus"

-- Disable all kinds of file history.
vim.opt.swapfile = false
vim.opt.backup = false
-- HMMM: Can undo files be actually useful?
vim.opt.undofile = false
vim.opt.undodir = ""
