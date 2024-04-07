-- Imports CodonadeKeymap.
local nap = require("codonade.keymap").nap

---@type LazyConfig
return {{
  "neovim/nvim-lspconfig",
  dependencies = {
    -- Automatically install LSPs and realted tools.
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",

    -- Configures Lua LSP for Neovim configuration.
    -- NOTE: `opts = {}` = `require("neodev").setup()`
    { "folke/neodev.nvim", opts = {}, },

    -- Extends Neovim with LSP progresses.
    {
      "j-hui/fidget.nvim",
      opts = {
        progress = {
          display = {
            -- Waits for 3 seconds before hiding the notifcation.
            done_ttl = 3,
            done_icon = "",
            progress_icon = {
              -- `. .. ...`
              pattern = "dots_ellipsis",
              -- HMMM:
              period = 1,
            },
          },
        },

        -- WARN: Required to work with Catppuccin.
        -- HMMM:
        notification = {
          window = {
            winblend = 0,
          },
        },
      },
    },
  },

  -- Setups LSP plugins.
  config = function(_,_)
    -- Runs when an LSP attaches to a particular buffer.
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("CodonadeLspKickstart", {
        -- Resets commands when reloading.
        clear = true,
      }),
      callback = function(event)
        local tickers = require("telescope.builtin")
        ---Maps a key in normal mode for the current LSP buffer.
        ---@param keys string Keys sequence to be pressed.
        ---@param func function Action to be executed.
        ---@param desc string Description of the keymap.
        local function map(keys, func, desc)
          nap(keys, func, (function()
            if desc then
              return "LSP: " .. desc
            else
              return ""
            end
          end)(), {
              buffer = event.buf,
            })
        end

        -- Fuzzy find all the symbols in the current document.
        map("<Leader>g?", tickers.lsp_document_symbols, "Goto Symbol")
        -- Goes to where a variable was first declared, a function is defined, etc...
        map("<Leader>gd", tickers.lsp_definitions, "Goto Definitions")
        -- Finds implementations of the current symbol.
        map("<Leader>gi", tickers.lsp_implementations, "Goto Implementations")
        -- Finds references for the current symbol.
        map("<Leader>gr", tickers.lsp_references, "Goto References")
        -- Jumps to the type of the current symbol.
        map("<Leader>gt", tickers.lsp_type_definitions, "Goto Type")

        -- Renames the current symbol.
        map("<Leader>rn", vim.lsp.buf.rename, "Rename")
        -- Executes a code action for the current symbol.
        map("<Leader>ca", vim.lsp.buf.code_action, "Code Action")
        -- Opens a documentation popup about the current symbol.
        map("K", vim.lsp.buf.hover, "Hover")
        -- WARN: This is *not* Goto Definitions, it's Goto Declaration.
        map("<Leader>gD", vim.lsp.buf.declaration, "Goto Declaration")
      end,
    })

    -- Brodcasts completion abilities into LSP servers.
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend(
      "force", capabilities,
      require("cmp_nvim_lsp").default_capabilities())

    ---@type table
    local servers = {
      lua_ls = {},
      rust_analyzer = {},
    }

    ---@type string[]
    local servers_names =
      -- NOTE: All the keys should be `strings`
      require("codonade.utils").keys(servers)
    ---@type lspconfig.Config
    local lspconfig = require("lspconfig")

    -- Automatically installs specified LSP servers.
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = servers_names,
      handlers = {
        ---@param server_name string Server name to handle.
        function(server_name)
          ---@type table
          local server =
            servers[server_name] or {}

          server.capabilities = vim.tbl_deep_extend(
            "force", {}, capabilities,
            server.capabilities or {})
          -- Setups `server` with configuration specified in `servers`
          lspconfig[server_name].setup(server)
        end,
      },
    })
  end,
}}
