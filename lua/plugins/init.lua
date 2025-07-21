return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },
  {
    "mason-org/mason.nvim",
    opts = {}
  },
  -- Mason-LSP Bridge
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "rust_analyzer", "lua_ls", "html", "cssls" },
      automatic_enable = true,
    },
    dependencies = {
      "neovim/nvim-lspconfig",
      "mason-org/mason.nvim",
    },
  }, 
   -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
  'mrcjkb/rustaceanvim',
  version = '^6', -- Recommended
  lazy = false, -- This plugin is already lazy
  },
  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
