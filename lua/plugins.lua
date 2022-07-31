local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use { 'navarasu/onedark.nvim' }
  use { 'tpope/vim-surround' }
  use { 'leafgarland/typescript-vim' }
  use { 'pangloss/vim-javascript' }
  use { 'peitalin/vim-jsx-typescript' }
  use { 'prettier/vim-prettier', run = 'yarn install' }

  use {
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons' }, tag = 'nightly'
  }

  use { 'itchyny/lightline.vim' }
  use { 'chrisbra/csv.vim' }
  use { 'nvim-treesitter/nvim-treesitter' }
  use { 'nvim-treesitter/nvim-treesitter-textobjects' }
  use { 'nvim-treesitter/nvim-treesitter-refactor' }
  use { 'nvim-lua/popup.nvim' }
  use { 'nvim-lua/plenary.nvim' }

  use { 'neovim/nvim-lspconfig' }
  use { 'williamboman/nvim-lsp-installer' }

  use { 'ibhagwan/fzf-lua' }
  use { 'vijaymarupudi/nvim-fzf' }
  use { 'kyazdani42/nvim-web-devicons' }
  use { 'windwp/nvim-spectre' }
  use { 'saadparwaiz1/cmp_luasnip' }
  use { 'L3MON4D3/LuaSnip' }
  use { 'rust-lang/rust.vim' }
  -- use { 'github/copilot.vim' }

  use { 'onsails/lspkind-nvim' }
  use { 'hrsh7th/nvim-cmp' }
  use { 'hrsh7th/cmp-nvim-lsp' }
 	use { 'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'}
  use { 'jose-elias-alvarez/null-ls.nvim' }
end)
