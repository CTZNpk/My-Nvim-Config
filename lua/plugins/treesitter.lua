return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = { "nvim-treesitter/nvim-treesitter-textobjects", "HiPhish/rainbow-delimiters.nvim"
  },

  config = function()
    local status_ok, configs = pcall(require, "nvim-treesitter.configs")
    if not status_ok then
      return
    end

    configs.setup({
      ensure_installed = "all",
      ignore_install = { "phpdoc" }, -- List of parsers to ignore installing
      highlight = {
        enable = true,            -- false will disable the whole extension
        disable = { "css" },      -- list of language that will be disabled
      },
      autopairs = {
        enable = true,
      },
      indent = { enable = true, disable = { "python", "css" } },
    })
    require("nvim-treesitter.configs").setup({
      rainbow = {
        enable = true,
        -- list of languages you want to disable the plugin for
        disable = { "jsx" },
        -- Which query to use for finding delimiters
        query = "rainbow-parens",
        -- Highlight the entire buffer all at once
        -- strategy = require("ts-rainbow.strategy.global"),
      },
    })
  end,
}
