local util = require("formatter.util");

-- require("formatter").setup({
--   logging = true,
--   filetype = {
--     typescript = {
--       function ()
--         return {
--           exe = "prettier",
--           args = {
--             "--stdin-filepath",
--             util.escape_path(util.get_current_buffer_file_path()),
--           },
--           stdin = true,
--           try_node_modules = true,
--         }
--       end
--     }
--   }
-- })

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  pattern = { "*.ts", "*.tsx" },
  callback = function()
    vim.cmd([[FormatWrite]])
  end
})

require("nvim-lsp-installer").setup({})
local lspconfig = require("lspconfig")

lspconfig.sumneko_lua.setup({})
lspconfig.tsserver.setup({})
lspconfig.eslint.setup({})
lspconfig.jsonls.setup({})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, {
    border = "single"
  }
)

_G.show_documentation = function()
  vim.cmd([[set eventignore=CursorHold]])
  vim.lsp.buf.hover()
  vim.cmd([[autocmd CursorMoved <buffer> ++once set eventignore=""]])
end

vim.diagnostic.config({
  virtual_text = false,
  float = { border = "single" }
})

vim.o.updatetime = 250
vim.cmd([[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, { focus = false })]])
