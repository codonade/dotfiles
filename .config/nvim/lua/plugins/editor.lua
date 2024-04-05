---@type LazyConfig
return {
  -- Displays buffers in a clasical tab bar fashion.
  {
    "akinsho/bufferline.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    opts = {
      -- Updates Bufferline to use the Catppuccin components.
      -- TODO: Customize highlights to match Catppuccin customizations.
      highlights = require("catppuccin.groups.integrations.bufferline").get({
        -- Disables special styles (defaults are "bold" and "italic")
        styles = {},
      }),
    },
  },

  -- Installs various small independent plugins.
  {
    "echasnovski/mini.nvim",
    -- Setups Mini modules independently.
    config = function()
      local statusline = require("mini.statusline")
      -- Uses font icons if a nerd font exists.
      statusline.setup({ use_icons = vim.g.have_nerd_font, })
    end,
  },
}
