local nap = require("codonade.keymap").nap
-- bootstrap Lazy, and install it if it's not installed.
local lazy_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazy_path) then
  -- LINK: https://lazy.folke.io/installation
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazy_path,
  })
end

-- append Lazy to Neovim's runtime path.
vim.opt.rtp:prepend(vim.env.LAZY or lazy_path)
-- install what's defined in `plugins`
require("lazy").setup("plugins")
-- Opens Lazy dashboard.
nap("<Leader>ll", ":Lazy<Return>", "Lazy: Lazy")
