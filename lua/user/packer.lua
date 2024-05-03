-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Telescope
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.6',
	  -- or                            , branch = '0.1.x',
	  requires = {
          {'nvim-lua/plenary.nvim'},
      }
  }

  -- Pywal colorscheme (default)
  use {
	  'AlphaTechnolog/pywal.nvim',
	  as = 'pywal',
  }

  -- Pywal-16 colorscheme
  use {
      'parz3val/pywal-complete.nvim',
      as = 'pywal16',
  }

  -- Catppuccin colorscheme
  use {
          "catppuccin/nvim",
          as = "catppuccin",
  }

  -- Treesitter
  use {
	  'nvim-treesitter/nvim-treesitter',
	  run = function()
		  local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
		  ts_update()
	  end,
      requires = {
        'p00f/nvim-ts-rainbow',
      },
  }


  -- nvim-tree
  use {
	  'nvim-tree/nvim-tree.lua',
	  requires = {
		  'nvim-tree/nvim-web-devicons', -- optional
	  },
  }

  -- transparency
  use {
	  'xiyaowong/transparent.nvim',
  }

  -- barbar
  use {
	  'romgrk/barbar.nvim',
	  requires = {
		  'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
		  'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
	  },
  }

  -- LSP-zero
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v3.x',
	  requires = {
		  --- Uncomment the two plugins below if you want to manage the language servers from neovim
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  {'neovim/nvim-lspconfig'},
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'L3MON4D3/LuaSnip'},
	  }
  }

  -- lualine
  use {
	  'nvim-lualine/lualine.nvim',
	  requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  -- nvim-surround
  use({
      "kylechui/nvim-surround",
      tag = "*", -- Use for stability; omit to use `main` branch for the latest features
  })

  -- Comments
  use {
      'numToStr/Comment.nvim',
  }

end)
