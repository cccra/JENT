local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.cmd('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  vim.cmd('packadd packer.nvim')
end

require('packer').startup(function()
use 'wbthomason/packer.nvim'
use {'nvim-telescope/telescope.nvim',-- Fuzzy find files
	event = 'CmdlineEnter',
	ft = 'norg',
	config = function()
		require('plugins.telescope')
	end,
	after = {'plenary.nvim', 'popup.nvim'},
	requires = {'nvim-lua/plenary.nvim', 'nvim-lua/popup.nvim'}
}
use {'TimUntersberger/neogit',-- Manage git within Vim
	cmd = 'Neogit',
	config = function()
		require('plugins.neogit')
	end
}
use {'numToStr/comment.nvim',-- Filetype-aware automatic commenting (gcc)
	keys = 'gc',
	config = function()
	    require('Comment').setup()
	end
}
use {'machakann/vim-sandwich',-- Quickly surround text objects with parentheses, etc.
	keys = 's'
}
use {'RRethy/vim-illuminate',-- highlight matching parentheses
	ft = {'python', 'sh', 'bash', 'tex', 'lua', 'css', 'html', 'cpp'},
	config = function()
		require('plugins.illuminate')
	end
}
use {'neovim/nvim-lspconfig',-- Language server linting and fixing
	ft = {'python', 'sh', 'bash', 'tex', 'lua', 'css', 'html', 'cpp'},
	cmd = {'LspInstallInfo', 'LspInstall', 'LspUninstall'},
}
use {'williamboman/nvim-lsp-installer',
	cmd = {'LspInstallInfo', 'LspInstall', 'LspUninstall'},
	after = 'nvim-lspconfig',
	config = function()
		require('plugins.nvim-lsp-installer')
	end
}
use {'hrsh7th/nvim-cmp',-- Autocompletion
	event = 'InsertEnter',
	ft = 'norg',
	config = function()
		require('plugins.nvim-cmp')
	end
}
use {'hrsh7th/cmp-buffer', after = 'nvim-cmp'}
use {'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp'}
use {'hrsh7th/cmp-path', after = 'nvim-cmp'}
use {'nvim-treesitter/nvim-treesitter',-- Extended syntax highlighting
	run = ':TSUpdate',
	-- ft = {'python', 'sh', 'bash', 'tex', 'lua', 'cpp', 'bib', 'html', 'css', 'norg'},
	config = function()
		require('plugins.treesitter')
	end
}
use {'folke/zen-mode.nvim',-- Distraction-free mode (<leader>g)
	cmd = 'ZenMode',
	config = function()
		require('plugins.zen-mode')
	end
}
use {'norcalli/nvim-colorizer.lua',-- Highlight colour codes
	ft = 'css',
	cmd = 'ColorizerToggle',
	config = function()
		require('colorizer').setup{'css'}
	end
}
use {'lukas-reineke/indent-blankline.nvim',-- Visual indentation guide
	config = function()
		require('plugins.indent-blankline')
	end
}
use {'simnalamburt/vim-mundo',-- Graphical undo
	cmd = 'MundoToggle',
}
use {'folke/which-key.nvim',-- Key binding hints
	keys = {'<leader>', '`', "'", '"', 'z', 'g'},
	config = function()
		require('plugins.which-key')
	end
}
use { 'nvim-neorg/neorg',
    config = function()
        require('plugins.neorg')
    end,
    requires = {'nvim-lua/plenary.nvim', 'nvim-neorg/neorg-telescope'},
	after = {'nvim-treesitter', 'nvim-cmp'}
}
end)
