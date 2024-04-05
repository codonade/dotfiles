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

        -- Matches colors with statusline colors.
        custom = {
          mocha = {
            fill = { bg = "#181825", },
            background = { bg = "#181825", },
            buffer_visible = { bg = "#181825", },
            close_button = { bg = "#181825", },
            close_button_visible = { bg = "#181825", },
            -- HMMM: How to exactly color separators?
          },
        },
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
