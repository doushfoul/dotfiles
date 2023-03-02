local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use { 'tpope/vim-surround' }
  use { 'prettier/vim-prettier', run = 'yarn install' }

  use {
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons' }, tag = 'nightly'
  }

  use { 'toppair/peek.nvim', run = 'deno task --quiet build:fast' }
  use { 'lukas-reineke/indent-blankline.nvim' }
  use { 'neovim/nvim-lspconfig' }
  use { 'williamboman/mason.nvim' }
  use { 'williamboman/mason-lspconfig.nvim' }
  use { 'itchyny/lightline.vim' }
  use { 'chrisbra/csv.vim' }
  use { 'nvim-treesitter/nvim-treesitter' }
  use { 'nvim-treesitter/nvim-treesitter-textobjects' }
  use { 'nvim-treesitter/nvim-treesitter-refactor' }
  use { 'nvim-lua/popup.nvim' }
  use { 'nvim-lua/plenary.nvim' }
  use { 'ibhagwan/fzf-lua' }
  use { 'vijaymarupudi/nvim-fzf' }
  use { 'kyazdani42/nvim-web-devicons' }
  use { 'saadparwaiz1/cmp_luasnip' }
  use { 'L3MON4D3/LuaSnip' }
  use { 'rust-lang/rust.vim' }
  use { 'onsails/lspkind-nvim' }
  use { 'hrsh7th/nvim-cmp' }
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-nvim-lsp-signature-help' }
 	use { 'tzachar/cmp-tabnine', run='./install.sh' }
  use { 'jose-elias-alvarez/null-ls.nvim' }
  use { 'themercorp/themer.lua' }
  use { 'nvim-lualine/lualine.nvim' } 
  use { 'norcalli/nvim-colorizer.lua' }
  use { 'folke/trouble.nvim' }
end)
