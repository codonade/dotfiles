local nap = require("codonade.keymap").nap

return {{
  "neovim/nvim-lspconfig",
  dependencies = {
    -- Automatically install LSPs and realted tools.
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    -- Configure the Lua LSP to support Neovim configuration APIs.
    { "folke/neodev.nvim", opts = {}, },

    -- Display LSPs progresses.
    {
      "j-hui/fidget.nvim",
      opts = {
        progress = {
          display = {
            -- Wait for 3 seconds before hiding the notifcation.
            done_ttl = 3,
            done_icon = "",
            progress_icon = {
              pattern = "dots_ellipsis",
              period = 1,
            },
          },
        },

        -- WARN: Required to work with Catppuccin.
        notification = {
          window = {
            winblend = 0,
          },
        },
      },
    },
  },

  config = function(_,_)
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("CodonadeLspKickstart", {
        clear = true,
      }),
      callback = function(event)
        local pickers = require("telescope.builtin")
        ---Maps a key in normal mode in buffers with LSP attached.
        ---@param keys string Keys sequence to be pressed.
        ---@param func function Action to be executed.
        ---@param desc string Description of the keymap.
        local function map(keys, func, desc)
          nap(keys, func, "LSP: " .. desc, {
              buffer = event.buf,
          })
        end

        map("<Leader>g?", pickers.lsp_document_symbols, "Goto Symbol")
        map("<Leader>gd", pickers.lsp_definitions, "Goto Definitions")
        map("<Leader>gi", pickers.lsp_implementations, "Goto Implementations")
        map("<Leader>gr", pickers.lsp_references, "Goto References")
        map("<Leader>gt", pickers.lsp_type_definitions, "Goto Type")
        map("<Leader>rn", vim.lsp.buf.rename, "Rename")
        map("<Leader>ca", vim.lsp.buf.code_action, "Code Action")
        map("K", vim.lsp.buf.hover, "Hover")
        map("<Leader>gD", vim.lsp.buf.declaration, "Goto Declaration")
      end,
    })

    -- Brodcast completion abilities into LSP servers.
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend(
      "force", capabilities,
      require("cmp_nvim_lsp").default_capabilities())

    ---@type table
    local servers = {
      lua_ls = {},
      clangd = {},
      pyright = {},
      rust_analyzer = {},
    }

    ---@type string[]
    local server_names =
      -- WARN: All the keys should be `strings`.
      require("codonade.utils").keys(servers)
    ---@type lspconfig.Config
    local lspconfig = require("lspconfig")

    -- Automatically install LSP `servers`.
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = server_names,
      automatic_installation = false,
      handlers = {
        ---@param sn string Server name to handle.
        function(sn)
          ---@type table
          local server = servers[sn] or {}
          server.capabilities = vim.tbl_deep_extend(
            "force", {}, capabilities, server.capabilities or {})
          lspconfig[sn].setup(server)
        end,
      },
    })
  end,
}}
