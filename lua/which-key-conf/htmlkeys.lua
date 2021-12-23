vim.cmd("PackerLoad which-key.nvim")
require("which-key").setup {

	require("which-key").register({ [" "] = "Jump to next marker" }, { prefix = " ", mode = "i", buffer = 0 }),
	require("which-key").register({ [" "] = "Jump to next marker" }, { prefix = " ", mode = "n", buffer = 0 }),

	-- headings
	require("which-key").register({ ["1"] = "New level 1 heading" }, { prefix = ";", mode = "i", buffer = 0 }),
	require("which-key").register({ ["2"] = "New level 2 heading" }, { prefix = ";", mode = "i", buffer = 0 }),
	require("which-key").register({ ["3"] = "New level 3 heading" }, { prefix = ";", mode = "i", buffer = 0 }),
	require("which-key").register({ ["4"] = "New level 4 heading" }, { prefix = ";", mode = "i", buffer = 0 }),
	require("which-key").register({ ["5"] = "New level 5 heading" }, { prefix = ";", mode = "i", buffer = 0 }),
	require("which-key").register({ ["6"] = "New level 6 heading" }, { prefix = ";", mode = "i", buffer = 0 }),

	-- styles
	require("which-key").register({ ["b"] = "Bold" }, { prefix = ";", mode = "i", buffer = 0 }),
	require("which-key").register({ ["e"] = "Italic" }, { prefix = ";", mode = "i", buffer = 0 }),
	require("which-key").register({ ["u"] = "Underlined" }, { prefix = ";", mode = "i", buffer = 0 }),

	require("which-key").register({ ["a"] = "New link" }, { prefix = ";", mode = "i", buffer = 0 }),
	require("which-key").register({ ["d"] = "New div" }, { prefix = ";", mode = "i", buffer = 0 }),
	require("which-key").register({ ["i"] = "New image" }, { prefix = ";", mode = "i", buffer = 0 }),
	require("which-key").register({ ["l"] = "New unordered list item" }, { prefix = ";", mode = "i", buffer = 0 }),
	require("which-key").register({ ["o"] = "New ordered list item" }, { prefix = ";", mode = "i", buffer = 0 }),
	require("which-key").register({ ["p"] = "New paragraph" }, { prefix = ";", mode = "i", buffer = 0 }),
	require("which-key").register({ ["t"] = "New title" }, { prefix = ";", mode = "i", buffer = 0 }),

}
