local M = {}
local utils = require('utils')
local logger = require('logger')

local function get_current_cursor_position()
  local cursor_position = vim.api.nvim_win_get_cursor(0)
  logger.log(string.format('Retrieved cursor at %s', vim.inspect(cursor_position)))
  return cursor_position;
end

local function restore_cursor_position(cursor_position)
  logger.log(string.format('Restoring cursor to %s', vim.inspect(cursor_position)))
  vim.fn.cursor(cursor_position[1], cursor_position[2])
end

local function execute_prettier_formatter()
  vim.schedule(function ()
    if utils.is_typescript_file() then
      local cursor_position = get_current_cursor_position()
      logger.log('Formatting buffer')
      vim.cmd([[silent %!prettier --stdin-filepath %]])
      restore_cursor_position(cursor_position)
    end
  end)
end

local function register_user_commands()
  vim.api.nvim_create_user_command('ExecutePrettier', function()
    execute_prettier_formatter()
  end, {})
end

local function register_auto_commands()
  vim.api.nvim_create_autocmd({ 'BufWrite' }, {
    callback = execute_prettier_formatter
  })
end

M.setup = function ()
  register_user_commands()
  register_auto_commands()
end

return M
