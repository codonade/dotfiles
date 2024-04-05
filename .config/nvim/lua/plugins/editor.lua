---@type LazyConfig
return {
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
