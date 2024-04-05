---Builds up a `statusline`
---@return string
local function statusline()
  ---Current filename, extracted out of any path.
  ---@type string
  local filename = "%t"
  ---Current line character and number.
  ---@type string
  local linecnum = "%l:%c"

  return string.format("%s %s %s", filename, "%=", linecnum)
end

-- Builds up a `statusline` and uses it.
-- TODO: Have different `statusline` for inactive windows.
vim.opt.statusline = statusline()
