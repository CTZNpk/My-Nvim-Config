local fn = vim.fn

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

local colorscheme = "kanagawa"

local status_ok, err = vim.cmd("autocmd VimEnter * colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("Failed to set colorscheme " .. colorscheme .. ": " .. err)
	return
end

local options = {
	backup = false, -- creates a backup file
	clipboard = "unnamedplus", -- allows neovim to access the system clipboard
	cmdheight = 2, -- more space in the neovim command line for displaying messages
	completeopt = { "menuone", "noselect" }, -- mostly just for cmp
	conceallevel = 0, -- so that `` is visible in markdown files
	fileencoding = "utf-8", -- the encoding written to a file
	hlsearch = true, -- highlight all matches on previous search pattern
	ignorecase = true, -- ignore case in search patterns
	mouse = "a", -- allow the mouse to be used in neovim
	pumheight = 10, -- pop up menu height
	showmode = false, -- we don't need to see things like -- INSERT -- anymore
	showtabline = 2, -- always show tabs
	smartcase = true, -- smart case
	smartindent = true, -- make indenting smarter again
	splitbelow = true, -- force all horizontal splits to go below current window
	splitright = true, -- force all vertical splits to go to the right of current window
	swapfile = false, -- creates a swapfile
	termguicolors = true, -- set term gui colors (most terminals support this)
	timeoutlen = 200, -- time to wait for a mapped sequence to complete (in milliseconds)
	undofile = true, -- enable persistent undo
	updatetime = 200, -- faster completion (4000ms default)
	writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
	expandtab = true, -- convert tabs to spaces
	shiftwidth = 2, -- the number of spaces inserted for each indentation
	tabstop = 2, -- insert 2 spaces for a tab
	cursorline = true, -- highlight the current line
	number = true, -- set numbered lines
	relativenumber = true, -- set relative numbered lines
	numberwidth = 4, -- set number column width to 2 {default 4}
	signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
	wrap = false, -- display lines as one long line
	linebreak = false, -- companion to wrap, don't split words
	scrolloff = 8, -- minimal number of screen lines to keep above and below the cursor
	sidescrolloff = 8, -- minimal number of screen columns either side of cursor if wrap is `false`
	guifont = "monospace:h17", -- the font used in graphical neovim applications
	whichwrap = "bs<>[]hl", -- which "horizontal" keys are allowed to travel to prev/next line
	autoindent = true, -- To auto indent the new text
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.opt.fillchars = vim.opt.fillchars + "eob: "
vim.opt.fillchars:append({
	stl = " ",
})

for k, v in pairs(options) do
	vim.opt[k] = v
end
vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd([[set iskeyword+=-]])
vim.cmd([[set formatoptions-=cro]]) -- TODO: this doesn't seem to work
vim.filetype.add({
	extension = {
		conf = "dosini",
	},
})

local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Undo Tree
keymap("n", "<Space-t>", ":UndotreeToggle", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate harpoons
keymap("n", "<S-l>", '<cmd>lua require("harpoon.ui").nav_prev()<cr>', opts)
keymap("n", "<S-h>", '<cmd>lua require("harpoon.ui").nav_next()<cr>', opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
---- Press jk fast to exit insert mode
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Nvimtree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

--Indent --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

vim.opt.rtp:prepend(lazypath) -- Install your plugins here

require("lazy").setup(

{
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
	{
	"kiyoon/jupynium.nvim",
	-- build = "pip3 install --r .",
	},
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
)

require("Haider.cmp")
require("Haider.lsp")
require("Haider.telescope")
require("Haider.treesitter")
require("Haider.autopairs")
require("Haider.gitsigns")
require("Haider.neoscroll")
require("Haider.nvim-tree")
require("Haider.toggleterm")
require("Haider.impatient")
require("Haider.indentline")
require("Haider.alpha")
require("Haider.whichkey")
require("Haider.jupynium")
