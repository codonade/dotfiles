---Builds up a `statusline`
---@return string statusline
local function statusline()
  ---@type string
  local filename = "%t"
  ---@type string
  local linecnum = "%l:%c"
  return string.format(
    "%s %s %s", filename, "%=", linecnum)
end

-- Builds up a `statusline` and uses it.
-- TODO: Have different `statusline` for inactive windows.
vim.opt.statusline = statusline()
