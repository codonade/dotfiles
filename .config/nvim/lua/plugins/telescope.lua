local nap = require("codonade.keymap").nap

return {{
  "nvim-telescope/telescope.nvim", branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      -- NOTE: This is only ran when installed/updated.
      -- WARN: On Ubuntu, this requires the `build-essential` package.
      build = "make",

      -- only install when `make` is installed.
      cond = function()
        return vim.fn.executable("make") == 1
      end,
    },
    -- WARN: Requires using a Nerd Font in the terminal.
    "nvim-tree/nvim-web-devicons",
    -- WARN: Overrides the default `vim.ui.select`.
    "nvim-telescope/telescope-ui-select.nvim",
  },

  config = function(_, opts)
    require("telescope").setup(opts)
    local pickers = require("telescope.builtin")
    nap("<Leader>fh", pickers.help_tags, "Find: Help")
    nap("<Leader>fk", pickers.keymaps, "Find: Keymaps")
    nap("<Leader>ff", pickers.find_files, "Find: Files")
    nap("<Leader><Leader>", pickers.buffers, "Find: Buffers")
    nap("<Leader>fw", pickers.grep_string, "Find: Word")
    nap("<Leader>fg", pickers.live_grep, "Find: Search")
    nap("<Leader>f?", pickers.current_buffer_fuzzy_find, "Find: Search (Buffer)")
  end,
}}
