local M = {}

local LogLevel = {
  info = "info",
  warn = "warn",
  error = "error",
}

local function format_message(level, message)
  local date = vim.fn.strftime("%Y-%m-%d %H:%M")
  print(string.format("[%s][%s]: %s", date, string.upper(level), message))
end

M.info = function (message)
  return format_message(LogLevel.info, message)
end

M.warn = function (message)
  return format_message(LogLevel.warn, message)
end

M.error = function (message)
  return format_message(LogLevel.error, message)
end

return M
