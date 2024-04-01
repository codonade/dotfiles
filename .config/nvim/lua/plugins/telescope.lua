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
    ---Telescope's builtin pickers.
    local pickers = require("telescope.builtin")
    -- NOTE: Wraps `setup` here to allow for customizing keymaps.
    require("telescope").setup(opts)

    -- Configures Telescope's keymaps.
    vim.keymap.set("n", "<Leader>fh", pickers.help_tags, { desc = "[F]ind in [H]elp", })
    vim.keymap.set("n", "<Leader>fk", pickers.keymaps, { desc = "[F]ind in [K]eymaps", })
    vim.keymap.set("n", "<Leader>ff", pickers.find_files, { desc = "[F]ind in [F]iles", })
    vim.keymap.set("n", "<Leader><Leader>", pickers.buffers, { desc = "<Leader> Find in Buffers" })
    vim.keymap.set("n", "<Leader>fw", pickers.grep_string, { desc = "[F]ind [W]ord", })
    vim.keymap.set("n", "<Leader>fg", pickers.live_grep, { desc = "[F]ind by [G]rep", })
    vim.keymap.set("n", "<Leader>f?", pickers.current_buffer_fuzzy_find, {
      desc = "[F]ind by Grep in Current Buffer [?]",
    })
  end,
}}
