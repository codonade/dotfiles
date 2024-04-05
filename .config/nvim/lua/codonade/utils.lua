---Collection of various, weird, and generally used utilities.
---@class CodonadeUtils
local M = {}

---Returns the keys of a given `table`
---@param tabl table Table to extract keys of.
---@return table keys Set of extracted keys.
function M.keys(tabl)
  ---Index of current table pair.
  ---@type integer
  local i = 0
  ---Set of extracted keys.
  ---@type table
  local keys = {}

  for k,_ in pairs(tabl) do
    i = i+1
    keys[i] = k
  end
  return keys
end

return M
