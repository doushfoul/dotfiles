vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'K', '<cmd>lua show_documentation()<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'rs', '<cmd>lua vim.lsp.buf.rename()<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'gr', '<cmd>lua require\'fzf-lua\'.lsp_references()<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<space>e', '<cmd>lua vim.lsp.diaknostic.show_line_diagnostics()<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', { noremap = true, silent = true })
vim.keymap.set('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', { noremap = true, silent = true })
vim.keymap.set("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", { noremap = true, silent = true })
vim.keymap.set('n', '<C-B>', [[<cmd>lua require('fzf-lua').buffers()<CR>]], { noremap = false, silent = true })
vim.keymap.set('n', '<C-P>', [[<cmd>lua require('fzf-lua').files()<CR>]], { noremap = false, silent = true })
vim.keymap.set('n', '<C-L>', [[<cmd>lua require('fzf-lua').grep()<CR>]], { noremap = false, silent = true })
vim.keymap.set('n', '<C-A>', [[<cmd>lua require('fzf-lua').lsp_code_actions()<CR>]], { noremap = false, silent = true })
vim.keymap.set('n', '<C-S>', [[<cmd>lua require('spectre').open_visual({ select_word = true })<CR>]], { noremap = false, silent = true })
vim.keymap.set('n', '<C-N>', [[<cmd>lua require('nvim-tree').toggle()<CR>]], { noremap = true, silent = true })

vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

--[[
vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", { expr = true })
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", { expr = true })
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", { expr = true })
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", { expr = true })
]]--

-- SPECTRE --
