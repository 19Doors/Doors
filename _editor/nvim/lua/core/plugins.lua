plugins = {

  -- == File Explorer | Smooth Scrolling ==

  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },

  {"stevearc/dressing.nvim", lazy=true, event='VeryLazy'},

  {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
  -- or                              , branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },

  {"declancm/cinnamon.nvim"},

  -- == Status Line | Bufferline | Indentation | Autopair ==
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons'
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
  },

  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
  },
  -- == LSP | Trouble | Debugger ==

  {"williamboman/mason.nvim", lazy=true},
  {"neovim/nvim-lspconfig"},
  {"nvimdev/lspsaga.nvim"},

  {
   "folke/trouble.nvim",
   dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  {"mfussenegger/nvim-dap", lazy=true},
  {"rcarriga/nvim-dap-ui",lazy=true},

  -- == Completion ==

  {"onsails/lspkind.nvim"},
  {"L3MON4D3/LuaSnip", lazy=true},
  {"saadparwaiz1/cmp_luasnip"},
  {"19Doors/friendly-snippets"},
  {"hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "hrsh7th/cmp-path", "hrsh7th/cmp-cmdline", "hrsh7th/nvim-cmp"},

  -- === Comments ===

  {
    'numToStr/Comment.nvim',
    lazy = false,
  },

  -- == Startup ==

  -- Dashboard
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    dependencies = { {'nvim-tree/nvim-web-devicons'}}
  },

  -- == Colorscheme == 
  {"decaycs/decay.nvim", as = "decay"},
  {"nvim-treesitter/nvim-treesitter"},
}
