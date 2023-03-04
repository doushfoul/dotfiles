local M = {}
local logger = require('logger')
local trouble = require('trouble')
local utils = require('utils')

local function show_diagnostics(args)
  logger.log('Show diagnostics in buffer')
  vim.diagnostic.show()
end

local function hide_diagnostics()
  logger.log('Hiding diagnostics in buffer')
  vim.diagnostic.hide()
end

local function register_autocmds()
  vim.api.nvim_create_autocmd({ 'DiagnosticChanged' }, {
    callback = function (args)
      if utils.is_in_node_modules() or utils.is_lua_file() then
        hide_diagnostics()
      else
        show_diagnostics()
      end
    end
  })
end

local function setup_diagnostics_signs()
    local signs = {
    Error = "",
    Warn = "",
    Hint = "",
    Info = "",
  }

  for type, icon in pairs(signs) do
    local sign = 'DiagnosticSign' .. type
    vim.fn.sign_define(sign, { text = icon, texthl = sign, numhl = sign })
  end
end

M.setup = function()
  vim.diagnostic.config({
    virtual_text = false,
    float = false
  })

  trouble.setup({})
  setup_diagnostics_signs()
  register_autocmds()
end

return M
