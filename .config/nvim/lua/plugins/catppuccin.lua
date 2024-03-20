return {{
  "catppuccin/nvim", name = "catppuccin",
  -- Ensures Catppuccin loads before other plugins.
  priority = 1000,

  -- Configures Catppuccin's options.
  opts = {
    -- `mocha` or or `frappe` or `macchiato` or `latte`
    flavour = "mocha",
    -- Applies the terminal background.
    transparent_background = true,
  },
  -- Initializes Catppuccin on startup.
  init = function()
    vim.cmd.colorscheme "catppuccin"
  end,
}}
