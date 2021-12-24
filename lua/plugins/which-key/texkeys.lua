vim.cmd("PackerLoad which-key.nvim")
require("which-key").setup {

	require("which-key").register({ [" "] = "which_key_ignore" }, { prefix = " ", mode = "i", buffer = 0 }),
	require("which-key").register({ [" "] = "which_key_ignore" }, { prefix = " ", mode = "n", buffer = 0 }),

	-- sections
	require("which-key").register({ ["1"] = "New section" }, { prefix = ";", mode = "i", buffer = 0 }),
	require("which-key").register({ ["2"] = "New subsection" }, { prefix = ";", mode = "i", buffer = 0 }),
	require("which-key").register({ ["3"] = "New subsubsection" }, { prefix = ";", mode = "i", buffer = 0 }),
	require("which-key").register({ ["4"] = "New subsubsubsection" }, { prefix = ";", mode = "i", buffer = 0 }),
	require("which-key").register({ ["5"] = "New subsubsubsubsection" }, { prefix = ";", mode = "i", buffer = 0 }),
	require("which-key").register({ ["6"] = "New subsubsubsubsubsection" }, { prefix = ";", mode = "i", buffer = 0 }),

	-- styles
	require("which-key").register({ s = {
		name = "Text styles",
		e = "Emphasis",
		i = "Italic",
		b = "Bold",
		u = "Underline",
		s = "Small caps",
		c = "Code",
		["^"] = "Superscript",
		},
	}, { prefix = ";", mode = "i", buffer = 0 }),

	-- environments
	require("which-key").register({ e = {
		name = "Environments",
		n = "New environment",
		o = "Numbered list",
		u = "Bullet-point list",
		f = "Figure",
		w = "Wrapfigure",
		t = "Table",
		c = "Columns",
		i = "Inline equation",
		e = "Equation",
		a = "Aligned",
		s = "Substitute environment",
		["*"] = "Toggle * on environment",
		},
	}, { prefix = ";", mode = "i", buffer = 0 }),
	require("which-key").register({ e = {
		name = "Environments",
		["*"] = "Toggle * on environment",
		s = "Substitute environment",
		},
	}, { prefix = ";" }),

	-- packages
	require("which-key").register({ p = {
		name = "Packages",
		a = "Add new package",
		},
	}, { prefix = ";", mode = "i", buffer = 0 }),
	require("which-key").register({ p = {
		name = "Packages",
		a = "Add new package",
		b = "Add bibliography",
		},
	}, { prefix = ";" }),

	-- lists
	require("which-key").register({ i = "Add list item" },
	{ prefix = ";", mode = "i", buffer = 0 }),
	require("which-key").register({ i = "Add list item" },
	{ prefix = ";" }),

	-- labels
	require("which-key").register({ l = {
		name = "Labels",
		a = "Add new label",
		r = "Refer to a label",
		},
	}, { prefix = ";", mode = "i", buffer = 0 }),
	require("which-key").register({ l = {
		name = "Labels",
		a = "Add new label",
		r = "Refer to a label",
		},
	}, { prefix = ";", mode = "n", buffer = 0 }),

	-- annotate
	require("which-key").register({ a = "Annotate at this point" },
	{ prefix = ";", mode = "i", buffer = 0 }),

	-- citation
	require("which-key").register({ c = "Add citation" },
	{ prefix = ";", mode = "i", buffer = 0 }),

	-- maths
	require("which-key").register({ m = {
		name = "Maths",
		m = "Matrix",
		e = "Equivalent",
		x = "Times",
		s = "Subset",
		[">"] = "Maps to",
		t = "Therefore",
		I = "Implies",
		v = "Vector",
		h = "Hat ^",
		i = "Dotless 'i'",
		j = "Dotless 'j'",
		d = "Maths over-dot",
		D = "Mathe over-double-dot",
		b = "Last-ditch bold",
		["["] = "Left and right square brackets",
		["("] = "Left and right round brackets",
		},
	}, { prefix = ";", mode = "i", buffer = 0 }),
	require("which-key").register({ t = {
		name = "Trigonometry",
		s = "sin",
		S = "arcsin",
		c = "cos",
		C = "arccos",
		t = "tan",
		T = "arctan",
		},
	}, { prefix = ";m", mode = "i", buffer = 0 }),
	require("which-key").register({ n = {
		name = "Number sets",
		N = "Natural number",
		Z = "Integer",
		Q = "Rational number",
		R = "Real number",
		C = "Complex number",
		I = "Imaginary number",
		},
	}, { prefix = ";m", mode = "i", buffer = 0 }),

	-- logic
	require("which-key").register({ L = {
		name = "Logical symbols",
		n = "Not",
		o = "Or",
		["&"] = "And",
		i = "Implies",
		b = "Is implied by",
		f = "Iff",
		a = "For all",
		e = "There exists",
		},
	}, { prefix = ";", mode = "i", buffer = 0 }),

	-- beamer
	require("which-key").register({ b = {
		name = "Beamer",
		f = "New frame",
		p = "Add pause",
		c = "New column",
		C = "double columns",
		},
	}, { prefix = ";", mode = "i", buffer = 0 }),
	require("which-key").register({ b = {
		name = "Beamer",
		p = "Add pause",
		},
	}, { prefix = ";" }),
}
