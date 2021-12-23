require('neorg').setup {
	load = {
		['core.defaults'] = {},
		-- ['core.norg.concealer'] = {},
		['core.norg.completion'] = {
			config = {
				engine = 'nvim-cmp'
			}
		},
		["core.norg.dirman"] = {
			config = {
				workspaces = {
					notes = "~/dox/.notes",
					todo = "~/dox/.todo",
				}
			}
		},
		['core.gtd.base'] = {
			config = {
				workspace = 'todo'
			}
		},
		['core.keybinds'] = {
			config = {
				default_keybinds = true,
				neorg_leader = '<leader>n'
			}
		},
		-- ['core.integrations.telescope'] = {},
		['core.integrations.treesitter'] = {
			config = {
				highlights = {
					Heading = {
						['1'] = {
							Title = '+Heading1',
							Prefix = '+Heading1'
						},
						['2'] = {
							Title = '+Heading2',
							Prefix = '+Heading2'
						},
						['3'] = {
							Title = '+Heading3',
							Prefix = '+Heading3'
						},
						['4'] = {
							Title = '+Heading4',
							Prefix = '+Heading4'
						},
						['5'] = {
							Title = '+Heading5',
							Prefix = '+Heading5'
						},
						['6'] = {
							Title = '+Heading6',
							Prefix = '+Heading6'
						}
					}
				}
			}
		}
	}
}
