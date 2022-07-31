require('settings')
require('plugins')
require('completion')
require('tree')
require('treesitter')
require('fzf-config')
require('spectre-config')
require('keymaps')

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

