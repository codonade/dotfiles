vim.diagnostic.config({
  -- Disables floating diagnostics.
  -- NOTE: Overalps with Codeium suggestions.
  virtual_text = false,
})

-- Displays LSP diagnostics while inserting.
-- WARN: Produces a lot of noise, but provides more context.
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    update_in_insert = true,
  }
)
