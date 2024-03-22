vim.diagnostic.config({
  virtual_text = {
    -- Sets spacing between text and diagnostic to its minimum.
    spacing = 0,
  },
})

-- Displays LSP diagnostics while typing.
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    update_in_insert = true,
  }
)
