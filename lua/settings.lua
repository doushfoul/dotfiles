vim.opt.completeopt = 'menu,menuone,noselect'
vim.opt.winbar = '%m %F'
vim.opt.clipboard:append('unnamedplus')
vim.opt.autoread = true
vim.opt.number = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.wrap = false
vim.opt.hlsearch = true
vim.opt.cursorline = true
vim.opt.ruler = true
vim.opt.incsearch = true
vim.opt.inccommand = 'split'
vim.opt.mouse = 'a'
vim.opt.foldlevel=99
vim.opt.foldmethod = 'indent'
vim.opt.laststatus = 2
vim.opt.guicursor = ''
vim.opt.autoindent = true
vim.opt.hidden = true
vim.opt.termguicolors = true
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.sessionoptions:append("localoptions")
vim.opt.grepprg = "rg --vimgrep --smart-case"
-- vim.opt.background=dark
