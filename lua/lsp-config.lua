require('mason').setup({
  ui = {
    icons = {
      package_installed = '✓',
      package_pending = '➜',
      package_uninstalled = '✗'
    }
  }
})

require('mason-lspconfig').setup({})

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
  vim.lsp.handlers.hover, {
    border = 'single'
  }
)

_G.show_documentation = function()
  vim.cmd([[set eventignore=CursorHold]])
  vim.lsp.buf.hover()
  vim.cmd([[autocmd CursorMoved <buffer> ++once set eventignore='']])
end

vim.diagnostic.config({
  virtual_text = false,
  float = { border = 'single' }
})

vim.o.updatetime = 250
vim.cmd([[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, { focus = false })]])
