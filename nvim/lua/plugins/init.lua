local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use {
    'pocco81/auto-save.nvim',
    config = function() require('auto-save').setup() end
  }

  -- LSP
  use 'neovim/nvim-lspconfig'
  use {
    'ray-x/lsp_signature.nvim',
    config = function()
      require("lsp_signature").setup()
    end
  }
  use({
    "j-hui/fidget.nvim",
    config = function()
      require("fidget").setup()
    end
  })
  
  -- Lua Snippets
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  -- Autocomplete 
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use {
    'hrsh7th/nvim-cmp',
    config = function()
      require('plugins.autocomplete')
    end
  }

  -- Theme
  use 'ayu-theme/ayu-vim'
  
  -- Navigation
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} },
    config = function()
      require('plugins.navigation')
    end
  }

  -- Code actions
  use 'tpope/vim-surround' -- Wraps smth by symbols
  use {
    'windwp/nvim-autopairs', -- Paste symbols as pairs
    config = function()
      require("nvim-autopairs").setup()
    end
  }
  use {
    'numToStr/Comment.nvim',  -- gcc to ez committing
    config = function()
      require('Comment').setup()
    end
  }
  use {
    'yamatsum/nvim-cursorline',  -- highliht word under cursor everywhere
    config = function()
      require('nvim-cursorline').setup({
        cursorline = {
          enable = true,
          timeout = 1000,
          number = false,
        },
        cursorword = {
          enable = true,
          min_length = 3,
          hl = { underline = true },
        }
      })
    end
  }

  if packer_bootstrap then
    require('packer').sync() -- Install all plugins first time
  end
end)

require("plugins.python")
