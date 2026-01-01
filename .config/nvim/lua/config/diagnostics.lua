vim.diagnostic.config({
  virtual_text = {
    -- set spacing between text and diagnostic to its minimum.
    spacing = 0,
  },
  -- sort diagnostics based on severity.
  severity_sort = true,
})

-- display LSP diagnostics while inserting.
-- WARN: Produces a lot of noise, but provides more context.
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    update_in_insert = true,
  }
)
