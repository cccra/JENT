require('zen-mode').setup {
	window = {
		backdrop = 1, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
		width = 110,
		height = .9,
		options = {
			signcolumn = 'no',
			number = false,
			relativenumber = false,
		},
	},
	plugins = {
		options = {
			enabled = true,
			ruler = false,
			showcmd = false,
		},
		gitsigns = { enabled = false },
	},
}

-- Enable ZenMode by default for mutt writting
-- autocmd BufRead,BufNewFile /tmp/neomutt* :ZenMode
-- autocmd BufRead,BufNewFile /tmp/neomutt* map ZZ :ZenMode\|x!<CR>
-- autocmd BufRead,BufNewFile /tmp/neomutt* map ZQ :ZenMode\|q!<CR>
