local M = {}
local utils = require('utils.utils')
local logger = require('utils.logger')

local function get_current_cursor_position()
  local cursor_position = vim.api.nvim_win_get_cursor(0)
  logger.info(string.format('Retrieved cursor at %s', vim.inspect(cursor_position)))
  return cursor_position;
end

local function restore_cursor_position(cursor_position)
  logger.info(string.format('Restoring cursor to %s', vim.inspect(cursor_position)))
  vim.fn.cursor(cursor_position[1], cursor_position[2])
end

local function format_buffer()
  logger.info('Formatting buffer')
  vim.cmd([[silent %!prettier --stdin-filepath %]])
end

local function execute_prettier_formatter()
  if utils.is_typescript_file() == false then
    return
  end

  local cursor_position = get_current_cursor_position()

  vim.schedule(function ()
    format_buffer()
    restore_cursor_position(cursor_position)
  end)
end

local function register_user_commands()
  vim.api.nvim_create_user_command('ExecutePrettier', function()
    execute_prettier_formatter()
  end, {})
end

local function register_auto_commands()
  vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
    callback = function()
      execute_prettier_formatter()
    end
  })
end

M.setup = function ()
  register_user_commands()
  register_auto_commands()
end

return M
