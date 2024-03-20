return {{
  "nvim-treesitter/nvim-treesitter",
  -- Updates all installed parsers to the latest version.
  build = ":TSUpdate",

  -- Configures Treesitter's Options.
  opts = {
    ensure_installed = {
      -- NOTE: Obviously I don't write in these!
      "vim", "vimdoc", "lua",
      -- Ensures parsers for Git files.
      "gitignore", "gitcommit", "gitattributes",
    },
    auto_install = true,
    highlight = {
      enable = true,
      -- NOTE: Languages that rely on Vim's regex system for indentation.
      additional_vim_regex_highlighting = {},
    },
    indent = {
      enable = true,
      -- NOTE: Languages that rely on Vim's regex system for indentation.
      disable = {},
    },
  },

  -- Setups Treesitter with configured `opts`
  config = function(_, opts)
    -- WARN: lazy.vim cannot detect Treesitter's setup function.
    require("nvim-treesitter.configs").setup(opts)
  end,
}}
