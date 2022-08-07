require('projections').setup({
  workspaces = {
   '~/DEV',
  },
  sessions_directory = '~/sessions',
})

-- Autostore session on VimExit
local Session = require("projections.session")
vim.api.nvim_create_autocmd({ 'VimLeavePre' }, {
  callback = function() Session.store(vim.loop.cwd()) end,
})

-- Switch to project if vim was started in a project dir
local switcher = require("projections.switcher")
vim.api.nvim_create_autocmd({ "VimEnter" }, {
  callback = function()
    if vim.fn.argc() == 0 then switcher.switch(vim.loop.cwd()) end
  end,
})

vim.api.nvim_create_user_command("Sessions", function()
  require('fzf-lua-p').projects()
end, {})

vim.api.nvim_create_user_command("StoreProjectSession", function()
    Session.store(vim.loop.cwd())
end, {})

vim.api.nvim_create_user_command("RestoreProjectSession", function()
    Session.restore(vim.loop.cwd())
end, {})
