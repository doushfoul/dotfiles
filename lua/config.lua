local function eslint_config_exists()
  local eslintrc = vim.fn.glob(".eslintrc*", 0, 1)

  if not vim.tbl_isempty(eslintrc) then
    return true
  end

  if not vim.fn.filereadable("package.json") then
    return false
  end

  if vim.fn.json_decode(vim.fn.readfile("package.json"))["eslintConfig"] then
    return true
  end

  return false
end

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

lspconfig.eslint.setup({
  root_dir = function()
    if not eslint_config_exists() then
      return nil
    end

    return vim.fn.getcwd()
  end
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover,
  require('cmp').config.window.bordered()
)
