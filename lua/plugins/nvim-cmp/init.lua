require('cmp').setup {
	snippet = {},
	mapping = {
		['<C-p>'] = require('cmp').mapping.select_prev_item(),
		['<C-n>'] = require('cmp').mapping.select_next_item(),
		['<C-d>'] = require('cmp').mapping.scroll_docs(-4),
		['<C-f>'] = require('cmp').mapping.scroll_docs(4),
		['<C-Space>'] = require('cmp').mapping.complete(),
		['<C-e>'] = require('cmp').mapping.close(),
	},
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'buffer' },
		{ name = 'path' },
		{ name = 'neorg' },
	},
}
