-- Navigates through tabs.
vim.keymap.set("n", "<Tab>", ":tabnext<Return>")
vim.keymap.set("n", "<S-Tab>", ":tabprev<Return>")

-- Selects to begenning of line.
vim.keymap.set("n", "<S-b>", "v^")
-- Selects to end of line.
vim.keymap.set("n", "<S-e>", "v$h")

-- Increments/decrements numbers.
vim.keymap.set("n", "+", "<C-a>")
vim.keymap.set("n", "-", "<C-x>")

-- Navgiates through buffers.
-- WARN: `bnext` not `bNext` - the latter has weird behaviors.
vim.keymap.set("n", "<Tab>", ":bnext<Return>")
-- HMMM: Why does every Neovim command use `prev` but this?
vim.keymap.set("n", "<S-Tab>", ":bprevious<Return>")

-- Navigates through diagnostics.
vim.keymap.set("n", "<Leader>cj", function()
  vim.diagnostic.goto_next()
end, { desc = "Goto next diagnostic" });
vim.keymap.set("n", "<Leader>ck", function()
  vim.diagnostic.goto_prev()
end, { desc = "Goto previous diagnostic" })

-- Selects an entire file.
vim.keymap.set("n", "<C-a>", "gg<S-v>G")
