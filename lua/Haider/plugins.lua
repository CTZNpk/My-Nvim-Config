local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

-- Install your plugins here
return packer.startup(function(use)
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/plenary.nvim"  -- Useful lua functions used by lots of plugins\

  -- ******ColorSchemes*************
  use "lunarvim/colorschemes" --Bunch of ColorSchemes
  use {
    "catppuccin/nvim",
    as = "catppuccin",
    config = function()
      require("catppuccin").setup {
        name = "catppuccin",
        priority = 1000,
        opts = {
          transparent_background = true,
          integrations = {
            telescope = true,
            harpoon = true,
            mason = true,
            neotest = true,
          }
        },
        config = function(_, opts)
          require('catppuccin').setup(opts)
          vim.cmd.colorscheme 'catppuccin-mocha'
        end
      }
    end
  }
  use {
    "folke/tokyonight.nvim",
    config = function()
      require("tokyonight").setup({
        transparent = true,
        styles = {
          sidebars = "transparent",
          floats = "transparent",
        }
      })
    end
  } -- Tokyo Night Colorscheme
  --************Nvim-Tree******************
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
  }
  use { "lukas-reineke/indent-blankline.nvim", tag = "v2.20.8" } --Line Indents

  --***********Code Runner***********
  use "CRAG666/code_runner.nvim"
  use "mfussenegger/nvim-dap"
  use "rcarriga/nvim-dap-ui"

  --***********AutoCompletion*********
  use "hrsh7th/nvim-cmp"          --The completion plugin
  use "hrsh7th/cmp-buffer"        --Buffer completion
  use "hrsh7th/cmp-path"          --Path Completions
  use "saadparwaiz1/cmp_luasnip"  --Snippets completion
  use "hrsh7th/cmp-nvim-lua"      --LSP
  use "hrsh7th/cmp-nvim-lsp"      --LSP
  use "VonHeikemen/lsp-zero.nvim" --LSP
  use "windwp/nvim-autopairs"     -- AutoPair the brackets
  use "mg979/vim-visual-multi"    --MultiCursor
  use "lvimuser/lsp-inlayhints.nvim"
  use "stevearc/dressing.nvim"
  use({
    "ziontee113/icon-picker.nvim",
    config = function()
      require("icon-picker").setup({
        disable_legacy_commands = true
      })
    end,
  })
  use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  })
  --*************Buffers******************
  use "akinsho/bufferline.nvim"
  use "moll/vim-bbye"
  use "vim-airline/vim-airline"
  use "vim-airline/vim-airline-themes"

  --****************Lualine*************************
  use 'nvim-lualine/lualine.nvim'

  --****************ToggleTerminal*******************
  use "akinsho/toggleterm.nvim"
  use "christoomey/vim-tmux-navigator"

  --******************LSP********************************
  use "neovim/nvim-lspconfig"           -- Enable LSP
  use "williamboman/mason.nvim"         --Simple to use language server installer
  use "williamboman/mason-lspconfig.nvim"
  use "jose-elias-alvarez/null-ls.nvim" --For formatter and linters
  use "RRethy/vim-illuminate"

  -- *******Snippets********
  use "L3MON4D3/LuaSnip"             --Snippets engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  --*************Telescope***************************
  use "nvim-telescope/telescope.nvim" --Fuzzy Finder
  use "preservim/tagbar"
  use "ThePrimeagen/harpoon"

  --**************TreeSitter************************
  use { 'nvim-treesitter/nvim-treesitter', commit = "f2778bd1a28b74adf5b1aa51aa57da85adfa3d16" }
  use { 'nvim-treesitter/nvim-treesitter-textobjects', commit = "35a60f093fa15a303874975f963428a5cd24e4a0" }
  use "HiPhish/nvim-ts-rainbow2"                    -- Rainbow Brackets
  use "JoosepAlviste/nvim-ts-context-commentstring" --For comments according to file  ]]
  use 'goolord/alpha-nvim'                          --starter
  use "antoinemadec/FixCursorHold.nvim"             -- This is needed to fix lsp doc highlights
  use "folke/which-key.nvim"

  --****************Impatient************************
  use 'lewis6991/impatient.nvim' --Faster loading times
  --**************Comments**************************
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup({
        toggler = {
          line = '<C-/>', -- Keybind for single line comment
          block = '<C-_>' -- Keybind for block comment
        },
        opleader = {
          line = '<C-/>',
          block = '<C-_>'
        },
      })
    end
  }

  --*********************Flutter***************************
  use {
    'akinsho/flutter-tools.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim', -- optional for vim.ui.select
    },
  }
  use "dart-lang/dart-vim-plugin"
  use "RobertBrunhage/flutter-riverpod-snippets"
  use "Neevash/awesome-flutter-snippets"

  --***************************ChatGPT**************************

  --**********************Scroll****************************
  use "karb94/neoscroll.nvim"

  --***********************Icons****************************
  use "kyazdani42/nvim-web-devicons"

  --***********************GIT*******************************
  use "tpope/vim-fugitive"      -- Git fugitive enables you to commit and do everything from the n mode
  use "lewis6991/gitsigns.nvim" --Git signs



  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
