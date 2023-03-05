M = {}

M.get_current_buffer = function ()
  local buffer_number = vim.fn.bufnr('%')
  return vim.fn.getbufinfo(buffer_number)[1]
end

M.is_current_buffer_modified = function ()
  local buffer = M.get_current_buffer()
  return buffer.changed == 1
end

return M
