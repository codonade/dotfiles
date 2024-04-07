-- Imports CodonadeKeymap.
local nap = require("codonade.keymap").nap

---@type LazyConfig
return {{
  "nvim-telescope/telescope.nvim", branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      -- NOTE: Only ran when installed/updated.
      -- WARN: On Ubuntu, requires `build-essential`
      build = "make",

      -- Only installs when `make` is installed.
      cond = function()
        return vim.fn.executable("make") == 1
      end,
    },
    -- WARN: Requires having a Nerd Font.
    "nvim-tree/nvim-web-devicons",
    -- WARN: Overrides default `vim.ui.select`
    "nvim-telescope/telescope-ui-select.nvim",
  },

  -- Setups Telescope with configured `opts`
  config = function(_, opts)
    local pickers = require("telescope.builtin")
    -- NOTE: Wraps `setup` here to allow for customizing keymaps.
    require("telescope").setup(opts)

    -- Configures Telescope's keymaps.
    nap("<Leader>fh", pickers.help_tags, "Find: Help")
    nap("<Leader>fk", pickers.keymaps, "Find: Keymaps")
    nap("<Leader>ff", pickers.find_files, "Find: Files")
    nap("<Leader><Leader>", pickers.buffers, "Find: Buffers")
    nap("<Leader>fw", pickers.grep_string, "Find: Word")
    nap("<Leader>fg", pickers.live_grep, "Find: Search")
    nap("<Leader>f?", pickers.current_buffer_fuzzy_find, "Find: Search (Buffer)")
  end,
}}
