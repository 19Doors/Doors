-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use "lewis6991/impatient.nvim"

  -- Theme
  use { 'decaycs/decay.nvim', as = 'decay' }

  -- DashBoard
  use { 'glepnir/dashboard-nvim' }

  -- Session Manager
  use 'Shatur/neovim-session-manager'
  use {'stevearc/dressing.nvim'}

  -- Indent
  use "lukas-reineke/indent-blankline.nvim"

  -- AutoPairs With Rainbox
  use { "windwp/nvim-autopairs" }
  use('mrjones2014/smart-splits.nvim')

  -- BufferLine
  use { 'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons' }

  -- LuaLine
  use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }

  -- NvimTree
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  -- TreeSitter
  use { 'nvim-treesitter/nvim-treesitter'}

  -- Smooth Scrolling
  use 'declancm/cinnamon.nvim'

  -- BetterEscape
  use { "max397574/better-escape.nvim" }

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  use { "williamboman/nvim-lsp-installer", "neovim/nvim-lspconfig" }

  -- CMP
  use { 'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path', 'hrsh7th/cmp-cmdline', 'hrsh7th/nvim-cmp' }

  -- LuaSnip
  use { 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' }

end)
