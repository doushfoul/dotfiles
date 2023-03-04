local M = {}

M.log = function (message)
  local date = vim.fn.strftime("%Y-%m-%d %H:%M")
  print(string.format("[%s][LSP]: %s", date, message))
end

return M
