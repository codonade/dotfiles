---Builds up a `statusline`
---@return string statusline
local function statusline()
  return "%t %= %l:%c"
end

-- Builds up a `statusline` and uses it.
-- TODO: Have different `statusline` for inactive windows.
vim.opt.statusline = statusline()
