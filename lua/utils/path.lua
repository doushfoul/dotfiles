local M = {}

local function buffer_has_extension(extension)
  if string.find(vim.fn.expand('%:e'), extension) then
    return true
  else
    return false
  end
end

local function has_path(path)
  if string.find(vim.fn.expand('%:p'), path) then
    return true
  else
    return false
  end
end

M.is_typescript_file = function()
  return buffer_has_extension('ts')
end

M.is_lua_file = function ()
  return buffer_has_extension('lua')
end

M.is_in_node_modules = function()
  return has_path('node_modules')
end

return M
