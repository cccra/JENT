require("which-key").setup {
	plugins = {
		presets = {
			operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
			motions = false, -- adds help for motions
			text_objects = false, -- help for text objects triggered after entering an operator
			windows = false, -- default bindings on <c-w>
			nav = false, -- misc bindings to work with windows
		},
	},
	window = {
		margin = { 0, 0, 0, 0 }, -- extra window margin [top, right, bottom, left]
		padding = { 1, 0, 1, 0 }, -- extra window padding [top, right, bottom, left]
	},
	layout = {
		height = { min = 1, max = 25 }, -- min and max height of the columns
	},

	require("which-key").register({ ["<Tab>"] = {
    	name = "Tabs",
    	c = "Close current tab",
    	e = "Fuzzy find file in new tab",
    	n = "New tab",
    	o = "Close all other tabs",
    	},
	}, { prefix = "<leader>" }),

	require("which-key").register({ b = {
    	name = "Bibliographies",
    	b = "LaTeX Bibliography",
    	r = "Groff Bibliography",
    	},
	}, { prefix = "<leader>" }),

	require("which-key").register({ f = {
    	name = "Fuzzy finder",
    	b = "Open buffers",
    	f = "Find a file",
    	s = "Search for word",
    	c = "Edit vim config",
    	r = "Recent files",
    	},
	}, { prefix = "<leader>" }),

	require("which-key").register({ l = {
		name = 'LSP',
		m = 'Manage installed servers',
		c = 'Information about object under cursor',
		n = 'Go to next LPS warning',
		p = 'Go to previous LPS warning',
		},
	}, { prefix = "<leader>" }),

	require("which-key").register({ t = {
    	name = "Templates",
    	b = "Beamer",
    	g = "Groff",
    	h = "HTML",
    	l = "LaTeX",
    	},
	}, { prefix = "<leader>" }),

	require("which-key").register({ n = {
    	name = "Neorg",
    	n = "Open Notes",
    	t = "Open Todo",
    	},
	}, { prefix = "<leader>" }),

	require("which-key").register({ k = "Toggle transparency" }, { prefix = "<leader>" }),

	require("which-key").register({ c = "Compile" }, { prefix = "<leader>" }),

	require("which-key").register({ d = "Distraction free mode" }, { prefix = "<leader>" }),

	require("which-key").register({ i = "which_key_ignore" }, { prefix = "<leader>" }),

	require("which-key").register({ g = "Manage git with Neogit" }, { prefix = "<leader>" }),

	require("which-key").register({ s = "Toggle spellcheck" }, { prefix = "<leader>" }),

	require("which-key").register({ o = "Open compiled output" }, { prefix = "<leader>" }),

	require("which-key").register({ p = "Update plugins" }, { prefix = "<leader>" }),

	require("which-key").register({ j = "Update Jent" }, { prefix = "<leader>" }),

	require("which-key").register({ h = "Toggle highlighting css colours" }, { prefix = "<leader>" }),

	require("which-key").register({ u = "Toggle visual undo" }, { prefix = "<leader>" }),

	require("which-key").register({ ["!"] = "which_key_ignore" }, { prefix = "w", mode = "c" }),

	-- require("which-key").register({ w = "Word count" }, { prefix = "<leader>" }),
}
