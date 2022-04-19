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
-- vim.api.nvim_create_autocommand({"BufRead", "BufNewFile"}, { pattern = "/tmp/neomutt*", command = "ZenMode" })
-- vim.api.nvim_create_autocommand({"BufRead", "BufNewFile"}, { pattern = "/tmp/neomutt*", command = "map ZZ :ZenMode\\|x!<CR>" })
-- vim.api.nvim_create_autocommand({"BufRead", "BufNewFile"}, { pattern = "/tmp/neomutt*", command = "map ZQ :ZenMode\\|q!<CR>" })
