require('settings')
require('plugins')
require('completion')
require('tree')
require('treesitter')
require('fzf-config')
require('spectre-config')
require('keymaps')

-- FORMATTER

local util = require("formatter.util")

require('formatter').setup({
  logging = true,
  filetype = {
    typescript = {
      function()
        return {
          exe = "prettier",
          args = {
            "--stdin-filepath",
            util.escape_path(util.get_current_buffer_file_path()),
          },
          stdin = true,
          try_node_modules = true,
        }
      end
    },
  }
})

vim.api.nvim_create_autocmd({"BufWritePost"}, {
  pattern = {"*.ts", "*.tsx"},
  callback = function()
    vim.cmd([[FormatWrite]])
  end
})
-- THEME

local onedark = require('onedark')
onedark.setup({
  style = 'deep'
})
onedark.load()


-- LSP SETUP

require("nvim-lsp-installer").setup({
    automatic_installation = true -- automatically detect which servers to install (based on which servers are set up via lspconfig)
})

local lspconfig = require('lspconfig')

lspconfig.tsserver.setup({})

lspconfig.sumneko_lua.setup({
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
})


-- lspconfig.eslint.setup({})
local nullls = require('null-ls')
nullls.setup({
  debug = true,
  sources = {
    nullls.builtins.formatting.stylua,
    nullls.builtins.diagnostics.eslint,
    nullls.builtins.completion.spell,
  },
})

