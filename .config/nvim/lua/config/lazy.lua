-- Bootstraps lazy.nvim, and installs it if it's not installed.
---@type string
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- DOCS: https://github.com/folke/lazy.nvim?tab=readme-ov-file#-installation
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
-- Appends lazy.nvim to the Neovim's runtime path.
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)
require("lazy").setup({})
