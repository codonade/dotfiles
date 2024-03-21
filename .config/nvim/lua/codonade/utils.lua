---Collection of various, weird, and generally used utilities.
---@type table
local Module = {}

---Returns the keys of a given `table.`
---@param tabl table
---@return table
function Module.keys(tabl)
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

return Module
