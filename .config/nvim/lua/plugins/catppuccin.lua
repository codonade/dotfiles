return {{
  "catppuccin/nvim", name = "catppuccin",
  -- Ensure Catppuccin loads before other plugins.
  priority = 1000,

  opts = {
    flavour = "mocha",
    -- Mimic transparency, while letting windows and menus be colored.
    color_overrides = {
      mocha = {
        -- WARN: Comes from the terminal background color.
        base = "#0C0C0C",
      },
    },

    -- Support additional plugins.
    integrations = {
      fidget = true,
      mini = {
        enabled = true,
        indentscope_color = "",
      },
    },
  },

  -- Set Catppuccin as the colorscheme on startup.
  init = function()
    vim.cmd.colorscheme("catppuccin")
  end,
}}
