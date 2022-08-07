local tree = require('nvim-tree')

-- vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
--   pattern = {"*"},
--   callback = function ()
--     vim.schedule(function()
--       tree.find_file()
--     end)
--   end
-- })

tree.setup({
  update_cwd = true
})
