vim.cmd("PackerLoad which-key.nvim")
require("which-key").setup {
	require("which-key").register({ [" "] = "Jump to next marker" }, { prefix = " ", mode = "i", buffer = 0 }),
	require("which-key").register({ [" "] = "Jump to next marker" }, { prefix = " ", mode = "n", buffer = 0 }),
}
