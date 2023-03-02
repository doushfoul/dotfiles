require('trouble').setup({})

local diagnosticSigns = {
  Error = "",
  Warn = "",
  Hint = "",
  Info = "",
}

for type, icon in pairs(diagnosticSigns) do
  local sign = 'DiagnosticSign' .. type
  vim.fn.sign_define(sign, { text = icon, texthl = sign, numhl = sign })
end
