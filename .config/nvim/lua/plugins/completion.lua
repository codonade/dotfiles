return {{
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    {
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",

      -- enable regular expressions in snippets.
      build = (function()
        -- WARN: Not supported in many Windows environments.
        if not (vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0) then
          return "make install_jsregexp"
        end
      end)(),
    },

    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-buffer",
    "onsails/lspkind.nvim",
  },

  config = function(_,_)
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")

    luasnip.config.setup({})
    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },

      completion = {
        completeopt = "menu,menuone,noinsert",
      },

      mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete({}),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-b>"] = cmp.mapping.scroll_docs(-1),
        ["<C-f>"] = cmp.mapping.scroll_docs(1),

        -- Navigates through snippets' "blocks".
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

        -- NOTE: Supports auto-imports if the language server supports it.
        -- NOTE: If the selected item is a snippet, this expands it.
        ["<Return>"] = cmp.mapping.confirm({ select = true, }),
      }),

      -- WARN: These come from separate plugins, and must be installed manually.
      sources = {
        { name = "nvim_lsp", },
        { name = "luasnip" },
        { name = "path", },
      },

      formatting = {
        fields = { "abbr", "kind", "menu", },
        expandable_indicator = true,
        format = lspkind.cmp_format(),
      },

      -- WARN: For now, ghost text overlaps with virtual diagnostics.
      -- experimental = {
      --  ghost_text = true,
      --},
    })
  end,
}}
