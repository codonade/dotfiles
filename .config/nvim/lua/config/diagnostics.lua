vim.diagnostic.config({
  virtual_text = {
    -- Sets spacing between text and diagnostic to its minimum.
    spacing = 0,
  },
})

-- Displays LSP diagnostics while inserting.
-- WARN: Produces a lot of noise, but provides more context.
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    update_in_insert = true,
  }
)
