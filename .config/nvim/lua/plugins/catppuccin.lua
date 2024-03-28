---@type LazyConfig
return {{
  "catppuccin/nvim", name = "catppuccin",
  -- Ensures Catppuccin loads before other plugins.
  priority = 1000,

  -- Configures Catppuccin's options.
  opts = {
    -- `mocha` or or `frappe` or `macchiato` or `latte`
    flavour = "mocha",
    -- Mimics transparency, while letting windows and menus be colored.
    color_overrides = {
      mocha = {
        -- WARN: Set this to your terminal's background color.
        -- NOTE: Coming from Microsoft's Cambell theme.
        base = "#0C0C0C",
      },
    },
    -- Supports additional plugins.
    integrations = {
      fidget = true,
    },
  },

  -- Setups Catppuccin with configured `opts`.
  config = function(_, opts)
    require("catppuccin").setup(opts)
    -- Highlights Codeium suggestions.
    vim.api.nvim_set_hl(0, "CodeiumSuggestion", {
      -- TODO: Alter the style a little bit.
      link = "Comment",
    })
  end,

  -- Initializes Catppuccin on startup.
  init = function()
    vim.cmd.colorscheme "catppuccin"
  end,
}}
