-- Bootstraps lazy.nvim, and installs it if it's not installed.
---@type string
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

-- Loads lazy.nvim with relevant options.
---@type LazyConfig
local opts = {
  spec = {
    -- Adds LazyVim and imports its plugins.
    { "LazyVim/LazyVim", import = "lazyvim.plugins", },
    -- Imports custom plugins.
  },
  defaults = {
    -- NOTE: It's recommended that only LazyVim plugins are lazy-loaded.
    lazy = false,
    -- Always installs the latest git commit.
    version = false,
  },
  installs = { colorscheme = { "tokyonight", }, },
  -- Automatically checks for plugin updates.
  checker = { enabled = true, },
  -- PERF: Disables some RTP plugins.
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
}
require("lazy").setup(opts)
