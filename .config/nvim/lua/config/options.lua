-- use GUI colors in supported terminals.
vim.opt.termguicolors = true
-- magically make Neovim responsive ;)
vim.opt.updatetime = 50

-- apply block cursor for very Vim mode.
vim.opt.guicursor = ""
-- hide Vim modes display.
vim.opt.showmode = false

-- split below when splitting horizontally.
vim.opt.splitbelow = true
-- split to the right when splitting vertically.
vim.opt.splitright = true

-- disable absolute line numbers.
vim.opt.number = false
-- alway display a single sign column.
vim.opt.signcolumn = "yes:1"

-- indent using 2 spaces.
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- enable advanced indentation.
vim.opt.smartindent = true
-- allow lines to exceed the screen width.
vim.opt.wrap = false
-- always end the file with a new line.
vim.opt.fixendofline = true

-- cap the maximum length for `popupmenu`.
vim.opt.pumheight = 10

-- highlight during and after search.
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- sync the clipboard between OS and Neovim.
-- HMMM: Not working in WSL2 (Ubuntu)...
vim.opt.clipboard = "unnamedplus"

-- disable all kinds of file history.
vim.opt.swapfile = false
vim.opt.backup = false
-- HMMM: Can undo files be actually useful?
vim.opt.undofile = false
vim.opt.undodir = ""
