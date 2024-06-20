return {
	"nvim-lua/plenary.nvim", -- Useful lua functions used by lots of plugins\

	-- ******ColorSchemes*************
	"rebelot/kanagawa.nvim",

	--************Nvim-Tree******************
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
	},
	{ "lukas-reineke/indent-blankline.nvim", tag = "v2.20.8" }, --Line Indents

	-- --***********Code Runner***********
	-- "CRAG666/code_runner.nvim"
	-- "mfussenegger/nvim-dap"
	-- "rcarriga/nvim-dap-ui"

	--***********AutoCompletion*********
	{
		"numToStr/Comment.nvim",
		opts = {
			-- add any options here
		},
	},
	"hrsh7th/nvim-cmp", --The completion plugin
	"hrsh7th/cmp-buffer", --Buffer completion
	"hrsh7th/cmp-path", --Path Completions
	"saadparwaiz1/cmp_luasnip", --Snippets completion
	"hrsh7th/cmp-nvim-lua", --LSP
	"hrsh7th/cmp-nvim-lsp", --LSP
	"VonHeikemen/lsp-zero.nvim", --LSP
	"windwp/nvim-autopairs", -- AutoPair the brackets
	"mg979/vim-visual-multi", --MultiCursor
	"lvimuser/lsp-inlayhints.nvim",
	"stevearc/dressing.nvim",
	-- {
	-- 	"ziontee113/icon-picker.nvim",
	-- 	config = function
	-- 		require"icon-picker".setup({
	-- 			disable_legacy_commands = true,
	-- 		})
	-- 	end,
	-- }
	"mbbill/undotree",
	-- {
	-- 	"kylechui/nvim-surround",
	-- 	tag = "*", --  for stability; omit to use `main` branch for the latest features
	-- 	config = function
	-- 		require("nvim-surround").setup({
	-- 		})
	-- 	end,
	-- },
	--{
	--	"kiyoon/jupynium.nvim",
	--	build = "pip3 install --r .",
	--},
	"rcarriga/nvim-notify",

	--*************Buffers******************
	-- "akinsho/bufferline.nvim"
	"moll/vim-bbye",
	"vim-airline/vim-airline",
	"vim-airline/vim-airline-themes",

	--****************Lualine*************************
	"nvim-lualine/lualine.nvim",

	--****************ToggleTerminal*******************
	"akinsho/toggleterm.nvim",
	"christoomey/vim-tmux-navigator",

	--******************LSP********************************
	"neovim/nvim-lspconfig", -- Enable LSP
	"williamboman/mason.nvim", --Simple to use language server installer
	"williamboman/mason-lspconfig.nvim",
	"jose-elias-alvarez/null-ls.nvim", --For formatter and linters
	"RRethy/vim-illuminate",

	-- *******Snippets********
	"L3MON4D3/LuaSnip", --Snippets engine
	"rafamadriz/friendly-snippets", -- a bunch of snippets to use

	--*************Telescope***************************
	"nvim-telescope/telescope.nvim", --Fuzzy Finder
	"preservim/tagbar",
	"ThePrimeagen/harpoon",

	--**************TreeSitter************************
	{ "nvim-treesitter/nvim-treesitter", commit = "f2778bd1a28b74adf5b1aa51aa57da85adfa3d16" },
	{ "nvim-treesitter/nvim-treesitter-textobjects", commit = "35a60f093fa15a303874975f963428a5cd24e4a0" },
	"HiPhish/nvim-ts-rainbow2", -- Rainbow Brackets
	"JoosepAlviste/nvim-ts-context-commentstring", --For comments according to file  ]]
	"goolord/alpha-nvim", --starter
	"antoinemadec/FixCursorHold.nvim", -- This is needed to fix lsp doc highlights
	"folke/which-key.nvim",

	--****************Impatient************************
	"lewis6991/impatient.nvim", --Faster loading times

	--*********************Flutter***************************
	-- "dart-lang/dart-vim-plugin"
	"RobertBrunhage/flutter-riverpod-snippets",
	"Neevash/awesome-flutter-snippets",

	--**********************Scroll****************************
	"karb94/neoscroll.nvim",

	--***********************Icons****************************
	"kyazdani42/nvim-web-devicons",

	--***********************GIT*******************************
	"tpope/vim-fugitive", -- Git fugitive enables you to commit and do everything from the n mode
	"lewis6991/gitsigns.nvim", --Git signs
}
