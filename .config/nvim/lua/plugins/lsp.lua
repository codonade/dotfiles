---@type LazyConfig
return {{
  "neovim/nvim-lspconfig",
  dependencies = {
    -- Automatically install LSPs and realted tools.
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",

    -- Configures Lua LSP for Neovim configuration.
    -- NOTE: `opts = {}` = `require("neodev").setup()`
    { "folke/neodev.nvim", opts = {} },
    -- Extends Neovim with notifications and LSP progress.
    -- NOTE: `opts = {}` = `require("fidget").setup()`
    { "j-hui/fidget.nvim", opts = {} },
  },

  -- Setups LSP plugins.
  config = function(_,_)
    -- Runs when an LSP attaches to a particular buffer.
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("CodonadeLspKickstart", { clear = true, }),
      callback = function(event)
        ---[T]elescope's builtin p[ickers].
        local tickers = require("telescope.builtin")
        ---Maps a key in normal mode for the current LSP buffer.
        ---@param keys string Key strokes to be pressed.
        ---@param func function Function to be executed.
        ---@param desc string Description for Which Key.
        local function map(keys, func, desc)
          vim.keymap.set("n", keys, func, {
            buffer = event.buf,
            desc = "LSP: " .. desc,
          })
        end

        -- Fuzzy find all the symbols in the current document.
        map("<Leader>g?", tickers.lsp_document_symbols, "[G]oto Symbol [?]")
        -- Goes to where a variable was first declared, a function is defined, etc...
        map("<Leader>gd", tickers.lsp_definitions, "[G]oto [D]efinitions")
        -- Finds implementations of the current symbol.
        map("<Leader>gi", tickers.lsp_implementations, "[G]oto [I]mplementations")
        -- Finds references for the current symbol.
        map("<Leader>gr", tickers.lsp_references, "[G]oto [R]eferences")
        -- Jumps to the type of the current symbol.
        map("<Leader>gt", tickers.lsp_type_definitions, "[G]oto [T]ype")

        -- Renames the current symbol.
        map("<Leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
        -- Executes a code action for the current symbol.
        map("<Leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
        -- Opens a documentation popup about the current symbol.
        map("<Leader>hd", vim.lsp.buf.hover, "[H]over [D]ocumenation")
        -- WARN: This is *not* Goto Definitions, it's Goto Declaration.
        map("<Leader>gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
      end,
    })

    ---Completion abilities brodcasted into LSP servers.
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend(
      "force", capabilities,
      require("cmp_nvim_lsp").default_capabilities())

    ---`table` of LSP servers and their configurations.
    ---@type table
    local servers = {
      lua_ls = {},
    }

    ---LSP servers installations names.
    ---@type string[]
    local servers_names =
      -- NOTE: All the keys should be `strings`
      require("codonade.utils").keys(servers)

    ---Neovim's LSP configuration.
    local lspconfig = require("lspconfig")
    -- Automatically installs specified LSP servers.
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = servers_names,
      handlers = {
        ---@param server_name string Server name to handle.
        function(server_name)
          ---Server to handle, infered from `server_name.`
          ---@type table
          local server = servers[server_name] or {}
          server.capabilities = vim.tbl_deep_extend(
            "force", {}, capabilities,
            server.capabilities or {})
          -- Setups `server` with configuration specified in `servers.`
          lspconfig[server_name].setup(server)
        end,
      },
    })
  end,
}}
