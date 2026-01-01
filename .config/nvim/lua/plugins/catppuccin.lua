return {{
  "catppuccin/nvim", name = "catppuccin",
  -- ensure Catppuccin loads before other plugins.
  priority = 1000,

  opts = {
    flavour = "mocha",
    -- mimic transparency, while letting windows and menus be colored.
    color_overrides = {
      mocha = {
        -- WARN: Comes from the terminal background color.
        base = "#0C0C0C",
      },
    },

    -- support additional plugins.
    integrations = {
      fidget = true,
      mini = {
        enabled = true,
        indentscope_color = "",
      },
    },
  },

  -- set Catppuccin as the colorscheme on startup.
  init = function()
    vim.cmd.colorscheme("catppuccin")
  end,
}}
