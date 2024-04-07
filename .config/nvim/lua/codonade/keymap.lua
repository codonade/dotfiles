---Wrapper over `vim.keymap.set` API.
---@class CodonadeKeymap
local M = {}

---Maps a sequence of keys in Normal mode.
---@param keys string Keys sequence to be pressed.
---@param func string|function Action to be executed.
---@param desc string Description of the keymap.
---@param opts table|nil Additional keymapping options.
function M.nap(keys, func, desc, opts)
  M.map("n", keys, func, desc, opts)
end

---Maps a sequence of keys.
---@param mode string Mode of the keymap.
---@param keys string Keys sequence to be pressed.
---@param func string|function Action to be executed.
---@param desc string Description of the keymap.
---@param opts table|nil Additional keymapping options.
function M.map(mode, keys, func, desc, opts)
  opts = opts or {}
  vim.keymap.set(mode, keys, func, {
    desc = desc or "",
    silent = opts.silent or true,
    noremap = (not opts.remap) or true,
    buffer = opts.buffer,
  })
end

return M
