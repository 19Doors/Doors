plugins = {
	{
		"decaycs/decay.nvim",
		as = "decay",
		lazy = false,
		config = function()
			vim.cmd([[colorscheme decay-dark]])
		end,
	},
	{
		"kylechui/nvim-surround",
		version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			vim.opt.termguicolors = true
			require("bufferline").setup({})
		end,
	},
	{
		"stevearc/oil.nvim",
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {},
		-- Optional dependencies
		dependencies = { { "echasnovski/mini.icons", opts = {} } },
		-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
		-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
		lazy = false,
	},

	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		-- or                              , branch = '0.1.x',
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	{ "neovim/nvim-lspconfig" },
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "master",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			require("config.pluginConfigs.ts")
		end,
	},
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
	-- {"hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "hrsh7th/cmp-path", "hrsh7th/cmp-cmdline", "hrsh7th/nvim-cmp"},
	{
		"mason-org/mason.nvim",
		opts = {
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
	},
	-- {
	-- 	"stevearc/conform.nvim",
	-- 	opts = {},
	-- 	config = function()
	-- 		require("conform").setup({
	-- 			formatters_by_ft = {
	-- 				lua = { "stylua" },
	-- 				-- Conform will run multiple formatters sequentially
	-- 				python = { "isort", "black" },
	-- 				-- You can customize some of the format options for the filetype (:help conform.format)
	-- 				rust = { "rustfmt", lsp_format = "fallback" },
	-- 				-- Conform will run the first available formatter
	-- 				javascript = { "prettierd", "prettier", stop_after_first = true },
	-- 				typescript = { "prettierd", "prettier", stop_after_first = true },
	-- 			},
	-- 			format_on_save = {
	-- 				timeout_ms = 500,
	-- 				lsp_format = "fallback",
	-- 			},
	-- 		})
	-- 	end,
	-- },
	-- {
	-- 	"L3MON4D3/LuaSnip",
	-- 	-- follow latest release.
	-- 	version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- 	-- install jsregexp (optional!).
	-- 	build = "make install_jsregexp",
	-- 	config = function() require("config.pluginConfigs.luasnip") end,
	-- },
}
