-- Shamelessly stolen from:
-- https://github.com/tjdevries/config.nvim/blob/master/lua/custom/f.lua
local M = {}

-- Print a table.
M.fun = function(t)
  local f = t[1]
  local args = { unpack(t, 2) }
  return function()
    return f(unpack(args))
  end
end

M.fn = function(f, ...)
  local args = { ... }
  return function(...)
    return f(unpack(args), ...)
  end
end

return M
