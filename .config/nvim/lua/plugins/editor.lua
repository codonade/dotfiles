---@type LazyConfig
return {
  -- Displays buffers in a clasical tab bar fashion.
  {
    "akinsho/bufferline.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    opts = {
      -- Updates Bufferline to use the Catppuccin components.
      -- TODO: Customize highlights to match Catppuccin customizations.
      highlights = require("catppuccin.groups.integrations.bufferline").get(),
    },
  }
}
