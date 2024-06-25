return {
	"nvim-lua/plenary.nvim", -- Useful lua functions used by lots of plugins\

	-- ******ColorSchemes*************
	"rebelot/kanagawa.nvim",

	-- --***********Code Runner***********
	"CRAG666/code_runner.nvim",

	--***********AutoCompletion*********
	{
		"numToStr/Comment.nvim",
		opts = {
			-- add any options here
		},
	},
	-- "lvimuser/lsp-inlayhints.nvim",
	"stevearc/dressing.nvim",
	"mbbill/undotree",
	-- {
	-- 	"kylechui/nvim-surround",
	-- 	tag = "*", --  for stability; omit to use `main` branch for the latest features
	-- 	config = function
	-- 		require("nvim-surround").setup({
	-- 		})
	-- 	end,
	-- },
	-- "rcarriga/nvim-notify",

	--*************Buffers******************
	"vim-airline/vim-airline",
	"vim-airline/vim-airline-themes",

	--****************ToggleTerminal*******************
	-- "akinsho/toggleterm.nvim",
	"christoomey/vim-tmux-navigator",

	--******************LSP********************************
	-- "neovim/nvim-lspconfig", -- Enable LSP
	-- "williamboman/mason.nvim", --Simple to use language server installer
	-- "williamboman/mason-lspconfig.nvim",
	-- "jose-elias-alvarez/null-ls.nvim", --For formatter and linters
	-- "RRethy/vim-illuminate",

	-- *******Snippets********
	-- "L3MON4D3/LuaSnip", --Snippets engine
	-- "rafamadriz/friendly-snippets", -- a bunch of snippets to use

	--*************Telescope***************************
	"ThePrimeagen/harpoon",

	--**************TreeSitter************************
	-- "HiPhish/nvim-ts-rainbow2", -- Rainbow Brackets

	--*********************Flutter***************************
	-- "dart-lang/dart-vim-plugin"

	--***********************Icons****************************
	"kyazdani42/nvim-web-devicons",

	--***********************GIT*******************************
	"tpope/vim-fugitive", -- Git fugitive enables you to commit and do everything from the n mode
}
