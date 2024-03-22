---@type LazyConfig
return {{
  "hrsh7th/nvim-cmp",
  -- Activates the plugin in insert mode.
  event = "InsertEnter",
  dependencies = {
    -- Installs a snippets engine and its sources.
    {
      "L3MON4D3/LuaSnip",
      -- Provides options to nvim-cmp.
      "saadparwaiz1/cmp_luasnip",

      -- Supports regular expressions in snippets.
      build = (function()
        -- WARN: Not supported in many Windows environments.
        -- NOTE: Remove `not` for Windows support.
        if not (vim.fn.has "win32" == 1 or vim.fn.executable "make" == 0) then
          return "make install_jsregexp"
        end
      end)(),
    },

    -- Autocompletes Neovim's APIs.
    "hrsh7th/cmp-nvim-lsp",
    -- Autocompletes file paths.
    "hrsh7th/cmp-path",
    -- Autocompletes buffer words.
    "hrsh7th/cmp-buffer",
  },

  -- Setups completion plugins.
  config = function(_,_)
    ---Community standard completion plugin.
    local cmp = require("cmp")
    ---Community standard "snipping" plugin.
    local luasnip = require("luasnip")

    luasnip.config.setup({})
    cmp.setup({
      -- Configures snippet engine.
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },

      -- DOCS: `:help 'completeopt'`
      completion = { completeopt = "menu,menuone,noinsert", },

      -- Configures keymaps for completion buffers.
      mapping = cmp.mapping.preset.insert {
        -- <Ctrl-Space> Manually triggers completion.
        ["<C-Space>"] = cmp.mapping.complete({}),

        -- <Ctrl> Select the [n]ext item
        ["<C-n>"] = cmp.mapping.select_next_item(),
        -- <Ctrl> Select the [p]revious item
        ["<C-p>"] = cmp.mapping.select_prev_item(),

        -- <Ctrl> Scroll the documentation window [b]ack.
        ["<C-b>"] = cmp.mapping.scroll_docs(-1),
        -- <Ctrl> Scroll the documentation window [f]orward.
        ["<C-f>"] = cmp.mapping.scroll_docs(01),

        -- Navigates through snippets blocks.
        -- WARN: No indication for end of expansion.
        ["<C-l>"] = cmp.mapping(function()
          if luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          end
        end, { "i", "s", }),
        ["<C-h>"] = cmp.mapping(function()
          if luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          end
        end, { "i", "s", }),

        -- <Enter> Accepts the selected completion.
        -- NOTE: Auto-imports if LSP supports it.
        -- NOTE: Expands snippets if LSP sent a snippet.
        ["<Enter>"] = cmp.mapping.confirm({ select = true, }),
      },

      -- Where do the completion options come from?
      -- WARN: Must be installed manually with `dependencies`
      sources = {
        { name = "nvim_lsp", },
        { name = "luasnip" },
        { name = "path", },
      },

      -- WARN: Overlaps with virtual diagnostics.
      -- experimental = {
      --  -- Previews the selected option.
      --  -- ghost_text = true,
      -- },
    })
  end,
}}
