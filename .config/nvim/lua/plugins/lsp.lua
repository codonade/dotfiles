
return {{
  "neovim/nvim-lspconfig",
  dependencies = {
    -- Automatically install LSPs and realted tools.
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",

    -- Extends Neovim with notifications and LSP progress.
    -- NOTE: `opts = {}` = `require("fidget").setup()`
    { "j-hui/fidget.nvim", opts = {} },

    -- Configures Lua LSP for Neovim configuration.
    -- NOTE: `opts = {}` = `require("neodev").setup()`
    { "folke/neodev.nvim", opts = {} },
  },

  -- Setups LSP plugins.
  config = function(_, _)
    -- Runs when an LSP attaches to a particular buffer.
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("LspKickstart", { clear = true, }),
      callback = function(event)
        ---[T]elescope's builtin [p]ickers.
        local tickers = require("telescope.builtin")
        ---Maps a key in normal mode for the current LSP buffer.
        ---@param keys string
        ---@param func function
        ---@param desc string
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

    -- Automatically installs specified LSP servers.
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = servers_names,
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          require("lspconfig")[server_name].setup(server)
        end,
      },
    })
  end,
}}
