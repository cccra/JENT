require('packer').startup(function()
use {'wbthomason/packer.nvim',
	cmd = 'Packer*',
	config = function() require('plugins.packer') end
	}
use {'nvim-telescope/telescope.nvim',-- Fuzzy find files
	keys = '<leader>f',
	cmd = 'Telescope',
	config = function() require('plugins.telescope') end,
	requires = 'nvim-lua/plenary.nvim',
}
use {'TimUntersberger/neogit',-- Manage git within Vim
	cmd = 'Neogit',
	config = function() require('plugins.neogit') end
}
use {'numToStr/comment.nvim',-- Filetype-aware automatic commenting (gcc)
	keys = 'gc',
	config = function() require('Comment').setup() end
}
use {'machakann/vim-sandwich',-- Quickly surround text objects with parentheses, etc.
	keys = 's'
}
use {'RRethy/vim-illuminate',-- highlight matching parentheses
	ft = {'python', 'sh', 'bash', 'tex', 'lua', 'css', 'html', 'cpp'},
	config = 'vim.g.Illuminate_delay = 70'
}
use {'neovim/nvim-lspconfig',-- Language server linting and fixing
	ft = {'python', 'sh', 'bash', 'tex', 'lua', 'css', 'html', 'cpp'},
	cmd = {'LspInstallInfo', 'LspInstall', 'LspUninstall'},
}
use {'williamboman/nvim-lsp-installer',
	cmd = {'LspInstallInfo', 'LspInstall', 'LspUninstall'},
	after = 'nvim-lspconfig',
	config = function() require('plugins.nvim-lsp-installer') end
}
use {'hrsh7th/nvim-cmp',-- Autocompletion
	ft = 'norg',
	event = 'InsertEnter',
	config = function() require('plugins.nvim-cmp') end
}
use {'hrsh7th/cmp-buffer', after = 'nvim-cmp'}
use {'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp'}
use {'hrsh7th/cmp-path', after = 'nvim-cmp'}
use {'nvim-treesitter/nvim-treesitter',-- Extended syntax highlighting
	run = ':TSUpdate',
	-- this must remain commented until the neorg parser is included in treesitter
	-- ft = {'python', 'sh', 'bash', 'tex', 'lua', 'cpp', 'bib', 'html', 'css', 'norg'},
	config = function() require('plugins.treesitter') end
}
use {'folke/zen-mode.nvim',-- Distraction-free mode (<leader>g)
	cmd = 'ZenMode',
	config = function() require('plugins.zen-mode') end
}
use {'norcalli/nvim-colorizer.lua',-- Highlight colour codes
	ft = 'css',
	cmd = 'ColorizerToggle',
	config = function() require('colorizer').setup{'css'} end
}
use {'lukas-reineke/indent-blankline.nvim',-- Visual indentation guide
	config = { "vim.g.indent_blankline_filetype_exclude = {'help', 'norg'}",
			   "vim.g.indent_blankline_buftype_exclude = {'terminal'}",
			   "vim.g.indent_blankline_show_first_indent_level = false"
	}
}
use {'simnalamburt/vim-mundo',-- Graphical undo
	cmd = 'MundoToggle',
}
use {'folke/which-key.nvim',-- Key binding hints
	keys = {'<leader>', '`', "'", '"', 'z', 'g'},
	config = function() require('plugins.which-key') end
}
use { 'nvim-neorg/neorg',
    config = function() require('plugins.neorg') end,
    requires = 'nvim-lua/plenary.nvim',
	after = {'nvim-treesitter', 'nvim-cmp'},
}
end)
