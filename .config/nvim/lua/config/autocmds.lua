-- Highlights yanked text.
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlights yanked text.",
  group = vim.api.nvim_create_augroup("CodonadeHighlightYank", {
    -- Resets commands when reloading.
    clear = true,
  }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
