---Collection of various, weird, and generally used utilities.
---@class CodonadeUtils
local M = {}

---Returns the keys of a given `table`
---@param tabl table Table to extract keys of.
---@return table keys Set of extracted keys.
function M.keys(tabl)
  ---@type integer
  local i = 0
  ---@type table
  local keys = {}

  for k,_ in pairs(tabl) do
    i = i+1
    keys[i] = k
  end
  return keys
end

---Returns the values of a given `table`
---@param tabl table Table to extract values of.
---@return table vals Set of extracted values.
function M.vals(tabl)
  ---@type integer
  local i = 0
  ---@type table
  local vals = {}

  for _,v in pairs(tabl) do
    i = i+1
    vals[i] = v
  end
  return vals
end

return M
