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

-- Override indentation for C files.
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { "*.c", "*.h", },
  group = vim.api.nvim_create_augroup("CodonadeIndent", {
    -- Resets commands when reloading.
    clear = true,
  }),
  callback = function()
    vim.opt.tabstop = 4
    vim.opt.softtabstop = 4
    vim.opt.shiftwidth = 4
  end,
})
