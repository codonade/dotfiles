return {{
  "nvim-treesitter/nvim-treesitter",
  -- updates all installed parsers to the latest version.
  build = ":TSUpdate",

  opts = {
    ensure_installed = {
      "vim", "vimdoc", "lua",
      "bash", "tmux", "json", "yaml", "toml",
      "gitignore", "gitcommit", "gitattributes",
      "javascript", "typescript",
      "c", "cpp", "python", "rust",
    },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = {},
    },
    indent = {
      enable = true,
      disable = {},
    },
  },

  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}}
