-- Packer Config
vim.cmd([[packadd packer.nvim]])
return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	use("kyazdani42/nvim-web-devicons")
	use("nvim-lua/plenary.nvim")

	-- Theme
	use({ "decaycs/decay.nvim", as = "decay" })

	-- Autopairs
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
		event = { "InsertEnter" },
	})

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

	use("RRethy/vim-illuminate")
	-- Comments
	use("numToStr/Comment.nvim")

	-- ToggleTerm
	use({ "akinsho/toggleterm.nvim", tag = "v2.*" })

	-- Nvim-Tree
	use({
		"kyazdani42/nvim-tree.lua",
		tag = "nightly", -- optional, updated every week. (see issue #1193)
	})

	-- LSP
	use({
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
		"jose-elias-alvarez/null-ls.nvim",
	})

	-- Files Finders
	use({ "nvim-telescope/telescope.nvim", tag = "0.1.0", cmd = "Telescope"})

	-- Utilities
	use({ "stevearc/dressing.nvim" })
	use("lewis6991/impatient.nvim")
	use({ "akinsho/bufferline.nvim", tag = "v2.*"})
	use("rcarriga/nvim-notify")
	use "matze/vim-move"
	use 'simrat39/symbols-outline.nvim'

	-- Completion
	use({
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",

		"onsails/lspkind.nvim",

		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",

		"ray-x/lsp_signature.nvim",

		-- Snippets
		"rafamadriz/friendly-snippets",
	})

	use({
		"glepnir/lspsaga.nvim",
		branch = "main",
		config = function()
			local saga = require("lspsaga")

			saga.init_lsp_saga({})
		end,
	})

	-- Statusline
	use("nvim-lualine/lualine.nvim")
end)
