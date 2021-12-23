local map = vim.api.nvim_buf_set_keymap
-- FUNCTIONS

--Get current indent
function CurrentIndent()
	local prev = vim.fn.prevnonblank('.')
	local spaces = vim.fn.indent(prev)
	local ShiftWidth = vim.inspect(vim.opt.shiftwidth:get())
	local ind = spaces / ShiftWidth
	return ind
end

--Inteligent line breaks for new environments (Yes, that's deliberately spelled wrong)
function ConstNewlines()
	local cur = vim.fn.line('.')
	local prev = vim.fn.prevnonblank('.')
	local ind = CurrentIndent()
	if cur - prev >= 2 then
		vim.cmd("norm "..ind.."A\t")
	elseif cur - prev == 1 then
		vim.cmd('norm o')
		vim.cmd("norm "..ind.."A\t")
	else
		vim.cmd('norm o')
		vim.cmd('norm o')
		vim.cmd("norm "..ind.."A\t")
	end
end

--Add list item with correct indentation and where I probably want it based on surrounding lines
function ListItem()
	local cur = vim.fn.line('.')
	local ind = CurrentIndent()
	if string.match(vim.fn.getline(cur), "\\item .*$") then
		vim.cmd("norm o\\item ")
	elseif (string.match(vim.fn.getline(cur), "\\begin{enumerate}") or string.match(vim.fn.getline(cur), "\\begin{itemize}")) then
		vim.cmd("norm o\t\\item ")
	elseif not (string.match(vim.fn.getline(cur-1), "\\item .*$") or string.match(vim.fn.getline(cur), "^\\s*$")) then
		ConstNewlines()
		vim.cmd("norm a\\item ")
	elseif string.match(vim.fn.getline(cur), "^$") then
		vim.cmd("norm "..ind.."A\t")
		vim.cmd("norm a\\item ")
	else
		vim.cmd("norm o\\item ")
	end
end

--Automate adding Tikzmarks
function AutoTikz()
	local save_pos = vim.fn.getpos(".")
	local nxtblank = vim.fn.search('^$')
	vim.fn.setpos('.', save_pos)
	vim.fn.inputsave()
	local id = vim.fn.input('Identifier: ')
	local note = vim.fn.input('Annotation: ')
	local position = vim.fn.getchar('Below [b] or Beside [s]? ')
	if position == 'b' then
		horiz = vim.fn.input('HORIZONTAL Displacement: ')
		vert = tostring(-0.7)
		outer = tostring(90)
		inner = tostring(270)
		yshift = tostring(-0.8)
		xshift = tostring(-1)
	else
		horiz = tostring(14)
		vert = vim.fn.input('VERTICAL Displacement: ')
		outer = tostring(180)
		inner = tostring(0)
		yshift = tostring(1)
		xshift = tostring(0)
	end
	vim.fn.inputrestore()
	vim.cmd('norm a \\tikzmark{'..id..'}')
	if not string.match(vim.fn.getline(nxtblank+1), '.*\\begin{tikzpicture}.*') then
		vim.fn.append(nxtblank, '\\begin{tikzpicture}[remember picture, overlay]')
		vim.fn.append(nxtblank+1, '\\end{tikzpicture}')
		vim.fn.append(nxtblank+2, '')
	end
	local endtikz = vim.fn.search('end{tikzpicture}', 'n')
	vim.fn.append(endtikz-1, '\t\\node ('..id..'ex) at ('..horiz..'cm,'..vert..'cm) {'..note..'};')
	vim.fn.append(endtikz, '\t\\draw ('..id..'ex) to[out='..outer..',in='..inner..'] ([yshift='..yshift..'ex,xshift='..xshift..'ex] {pic cs:'..id..'});')
	vim.cmd('norm `^')
end

--Returns the surrounding LaTeX environment
function SurrEnv()
	local BeginLine = vim.fn.getline(vim.fn.searchpairpos('\\\\begin', '', '\\\\end', 'bn')[1])
	local Env = vim.fn.matchstr(BeginLine, '{\\zs.*\\ze}')
	return Env
end

--Add environment
function AddNewEnv()
	local env = vim.fn.expand('<cword>')
	if env == '' then
		vim.fn.inputsave()
		env = vim.fn.input('Environment type: ')
		vim.fn.inputrestore()
	else
		vim.cmd('norm daw')
	end
	ConstNewlines()
	vim.cmd('norm a\\begin{'..env..'}')
	vim.cmd('norm o\\end{'..env..'}')
	vim.cmd('norm o<++>')
	if (env == "enumerate") or (env == "itemize") then
		vim.cmd('norm 2ko\t\\item ')
	else
		vim.cmd('norm 2ko\t')
	end
end

--Add environment around visual selection
function AddNewVisEnv()
	vim.fn.inputsave()
	local env = vim.fn.input('Environment type: ')
	vim.fn.inputrestore()
	vim.cmd('norm `<O\\begin{'..env..'}')
	vim.cmd('norm `>o\\end{'..env..'}')
	vim.cmd('norm gv>')
end

--Change environmnet
function ChangeEnv(env)
	if env == nil then
		vim.fn.inputsave()
		env = vim.fn.input("Change environment to: ")
		vim.fn.inputrestore()
	end
	local BeginLine = vim.fn.searchpairpos('\\\\begin', '', '\\\\end', 'bn')[1]
	local BeginLineContent = vim.fn.getline(BeginLine)
	local EndLine = vim.fn.searchpairpos('\\\\begin', '', '\\\\end', 'n')[1]
	local EndLineContent = vim.fn.getline(EndLine)
	local CurEnv = SurrEnv()
	vim.fn.setline(BeginLine, vim.fn.substitute(BeginLineContent, CurEnv, env, ''))
	vim.fn.setline(EndLine, vim.fn.substitute(EndLineContent, CurEnv, env, ''))
end

--Toggle * on environment
function ToggleStarEnv()
	CurEnv = SurrEnv()
	if CurEnv == ".*\\*" then
		NewEnv = vim.fn.substitute(CurEnv, "*", '', '')
		ChangeEnv(NewEnv)
	else
		NewEnv = vim.fn.substitute(CurEnv, "$", "*", '')
		ChangeEnv(NewEnv)
	end
end

--general
map(0, 'n', ';;', ';', { noremap = true, silent = true } )
map(0, 'n', '<Space><Space>', '/<++><CR>"_cf>', { noremap = true, silent = true } )
map(0, 'i', '<Space><Space>', '<Esc>/<++><CR>"_cf>', { noremap = true, silent = true } )
map(0, 'n', '<s-Space><s-Space>', '?<++><CR>"_cf>', { noremap = true, silent = true } )
map(0, 'i', '<s-Space><s-Space>', '<Esc>?<++><CR>"_cf>', { noremap = true, silent = true } )

-- styles
map(0, 'i', ';se', '\\emph{}<Space><++><Esc>F}i', { noremap = true, silent = true } )
map(0, 'i', ';si', '\\textit{}<Space><++><Esc>F}i', { noremap = true, silent = true } )
map(0, 'i', ';sb', '\\textbf{}<Space><++><Esc>F}i', { noremap = true, silent = true } )
map(0, 'i', ';su', '\\underline{}<Space><++><Esc>F}i', { noremap = true, silent = true } )
map(0, 'i', ';ss', '\\textsc{}<Space><++><Esc>F}i', { noremap = true, silent = true } )
map(0, 'i', ';sc', '\\texttt{}<Space><++><Esc>F}i', { noremap = true, silent = true } )
map(0, 'i', ';s^', '\\textsuperscript{}<Space><++><Esc>F}i', { noremap = true, silent = true } )
map(0, 'i', ';s_', '\\textsubscript{}<Space><++><Esc>F}i', { noremap = true, silent = true } )

-- sections
map(0, 'i', ';1', '<c-o>:lua ConstNewlines()<CR>\\section{}<CR><++><ESC>k$i', { noremap = true, silent = true } )
map(0, 'i', ';2', '<c-o>:lua ConstNewlines()<CR>\\subsection{}<CR><++><ESC>k$i', { noremap = true, silent = true } )
map(0, 'i', ';3', '<c-o>:lua ConstNewlines()<CR>\\subsubsection{}<CR><++><ESC>k$i', { noremap = true, silent = true } )
map(0, 'i', ';4', '<c-o>:lua ConstNewlines()<CR>\\subsubsubsection{}<CR><++><ESC>k$i', { noremap = true, silent = true } )
map(0, 'i', ';5', '<c-o>:lua ConstNewlines()<CR>\\subsubsubsubsection{}<CR><++><ESC>k$i', { noremap = true, silent = true } )
map(0, 'i', ';6', '<c-o>:lua ConstNewlines()<CR>\\subsubsubsubsubsection{}<CR><++><ESC>k$i', { noremap = true, silent = true } )

-- environments
map(0, 'i', ';en', '<c-o>:lua AddNewEnv()<cr>', { noremap = true, silent = true } )
map(0, 'v', ';en', ':lua AddNewVisEnv()<cr>', { noremap = true, silent = true } )
map(0, 'i', ';es', '<c-o>:lua ChangeEnv()<cr>', { noremap = true, silent = true } )
map(0, 'n', ';es', ':lua ChangeEnv()<cr>', { noremap = true, silent = true } )
map(0, 'i', ';e*', '<c-o>:lua ToggleStarEnv()<cr>', { noremap = true, silent = true } )
map(0, 'n', ';e*', ':lua ToggleStarEnv()<cr>', { noremap = true, silent = true } )
map(0, 'i', ';eo', '<c-o>:lua ConstNewlines()<CR>\\begin{enumerate}<CR>\\end{enumerate}<CR><++><Esc>kO<Tab>\\item<Space>', { noremap = true, silent = true } )
map(0, 'i', ';eu', '<c-o>:lua ConstNewlines()<CR>\\begin{itemize}<CR>\\end{itemize}<CR><++><Esc>kO<Tab>\\item<Space>', { noremap = true, silent = true } )
map(0, 'i', ';ef', '<c-o>:lua ConstNewlines()<CR>\\begin{figure}[h]<CR>\\centering<CR>\\includegraphics[width=\\textwidth]{<++>}<CR>\\caption{<++>}<CR>\\end{figure}<CR><++><Esc>3k0f=a', { noremap = true, silent = true } )
map(0, 'i', ';ew', '<c-o>:lua ConstNewlines()<CR>\\begin{wrapfigure}{}{3.5in}<CR>\\centering<CR>\\includegraphics[width=3in]{<++>}<CR>\\caption{<++>}<CR>\\end{wrapfigure}<CR><++><Esc>6k0/{}<CR>a', { noremap = true, silent = true } )
map(0, 'i', ';et', '<c-o>:lua ConstNewlines()<CR>\\begin{tabular}{}<CR><++><CR>\\end{tabular}<CR><++><Esc>3k$i', { noremap = true, silent = true } )
map(0, 'i', ';ec', '<c-o>:lua ConstNewlines()<CR>\\begin{multicols}{2}<CR><CR><CR>\\{columnsplit}<CR><CR><++><CR><CR>\\end{multicols}6ko', { noremap = true, silent = true } )
map(0, 'i', ';ei', '$$<++><Esc>F$i', { noremap = true, silent = true } )
map(0, 'i', ';ee', '<c-o>:lua ConstNewlines()<CR>\\begin{equation}<CR>\\end{equation}<CR><++><ESC>kO<Tab>', { noremap = true, silent = true } )
map(0, 'i', ';ea', '<c-o>:lua ConstNewlines()<CR>\\begin{align}<CR>\\end{align}<CR><++><Esc>kO<Tab>', { noremap = true, silent = true } )

-- packages
map(0, 'n', ';pb', "/\\\\usepac<CR>}I\\usepackage[backend=biber,style=mla]{biblatex}<CR>\\addbibresource{$BIB}<CR><Esc>/\\\\end{document}<CR>O\\printbibliography<Esc><c-o><c-o>", { noremap = true, silent = true } )
map(0, 'n', ';pa', 'gg/usepackage<CR>}O\\usepackage{}<Esc>i', { noremap = true, silent = true } )
map(0, 'i', ';pa', '<ESC>G?usepackage<CR>o\\usepackage{}<Esc>i', { noremap = true, silent = true } )

-- lists
map(0, 'i', ';i', '<c-o>:lua ListItem()<CR>', { noremap = true, silent = true } )
map(0, 'n', ';i', ':lua ListItem()<CR>A', { noremap = true, silent = true } )

-- labels
map(0, 'i', ';la', '\\label{}<Esc>i', { noremap = true, silent = true } )
map(0, 'n', ';la', 'A\\label{}<Esc>i', { noremap = true, silent = true } )
map(0, 'i', ';lr', '\\ref{}<Space><++><Esc>F}i', { noremap = true, silent = true } )
map(0, 'n', ';lr', 'A\\ref{}<Space><++><Esc>F}i', { noremap = true, silent = true } )

-- annotate
map(0, 'i', ';a', '<c-o>:lua AutoTikz()<CR>', { noremap = true, silent = true } )

-- citation
map(0, 'i', ';c', '\\autocite{}<Space><++><Esc>F}i', { noremap = true, silent = true } )

-- Maths
map(0, 'i', '//', '\\frac{}{<++>}<++><Esc>Fcla', { noremap = true, silent = true } )
map(0, 'i', ';mm', '<c-o>:lua ConstNewlines()<CR>\\begin{pmatrix}<CR>\\end{pmatrix}<CR><++><Esc>kO<Tab>', { noremap = true, silent = true } )
map(0, 'i', ';me', '\\equiv', { noremap = true, silent = true } )
map(0, 'i', ';mx', '\\times', { noremap = true, silent = true } )
map(0, 'i', ';m+', '\\pm', { noremap = true, silent = true } )
map(0, 'i', ';ms', '\\subset', { noremap = true, silent = true } )
map(0, 'i', ';m>', '\\mapsto', { noremap = true, silent = true } )
map(0, 'i', ';mt', '\\therefore', { noremap = true, silent = true } )
map(0, 'i', ';mI', '\\implies', { noremap = true, silent = true } )
map(0, 'i', ';mv', '\\vec{}<++><Esc>F}i', { noremap = true, silent = true } )
map(0, 'i', ';mh', '\\hat{}<++><Esc>F}i', { noremap = true, silent = true } )
map(0, 'i', ';mi', '\\imath', { noremap = true, silent = true } )
map(0, 'i', ';mj', '\\jmath', { noremap = true, silent = true } )
map(0, 'i', ';md', '\\dot{}<++><Esc>F}i', { noremap = true, silent = true } )
map(0, 'i', ';mD', '\\ddot{}<++><Esc>F}i', { noremap = true, silent = true } )
map(0, 'i', ';mb', '\\pmb{}<++><Esc>F}i', { noremap = true, silent = true } )
map(0, 'i', ';m[', '\\left[<Space><Space>\\right]<Space><++><Esc>F[la', { noremap = true, silent = true } )
map(0, 'i', ';m(', '\\left(<Space><Space>\\right)<Space><++><Esc>F(la', { noremap = true, silent = true } )
map(0, 'i', ';mts', '\\sin', { noremap = true, silent = true } )
map(0, 'i', ';mtS', '\\arcsin', { noremap = true, silent = true } )
map(0, 'i', ';mtc', '\\cos', { noremap = true, silent = true } )
map(0, 'i', ';mtC', '\\arccos', { noremap = true, silent = true } )
map(0, 'i', ';mtt', '\\tan', { noremap = true, silent = true } )
map(0, 'i', ';mtT', '\\arctan', { noremap = true, silent = true } )
map(0, 'i', ';mnN', '\\mathbb{N}', { noremap = true, silent = true } )
map(0, 'i', ';mnZ', '\\mathbb{Z}', { noremap = true, silent = true } )
map(0, 'i', ';mnQ', '\\mathbb{Q}', { noremap = true, silent = true } )
map(0, 'i', ';mnR', '\\mathbb{R}', { noremap = true, silent = true } )
map(0, 'i', ';mnC', '\\mathbb{C}', { noremap = true, silent = true } )
map(0, 'i', ';mnI', '\\mathbb{D}', { noremap = true, silent = true } )

-- Logic
map(0, 'i', ';Ln', '${\\neg}$', { noremap = true, silent = true } )
map(0, 'i', ';Lo', '${\\vee}$', { noremap = true, silent = true } )
map(0, 'i', ';L&', '${\\wedge}$', { noremap = true, silent = true } )
map(0, 'i', ';Li', '${\\rightarrow}$', { noremap = true, silent = true } )
map(0, 'i', ';Lb', '${\\leftarrow}$', { noremap = true, silent = true } )
map(0, 'i', ';Lf', '${\\leftrightarrow}$', { noremap = true, silent = true } )
map(0, 'i', ';La', '${\\forall}$', { noremap = true, silent = true } )
map(0, 'i', ';Le', '${\\exists}$', { noremap = true, silent = true } )

-- Beamer
map(0, 'i', ';bf', '<c-o>:lua ConstNewlines()<CR>\\begin{frame}<CR>\\frametitle{}<CR><CR><++><CR><CR>\\end{frame}<CR><++><Esc>5k0f{a', { noremap = true, silent = true } )
map(0, 'i', ';bp', '<Esc>A<Space>\\pause<Esc>', { noremap = true, silent = true } )
map(0, 'n', ';bp', 'A<Space>\\pause<Esc>', { noremap = true, silent = true } )
map(0, 'i', ';bc', '\\column{.\\textwidth}<CR><++><Esc>k0f.a', { noremap = true, silent = true } )
map(0, 'i', ';bC', '<c-o>:lua ConstNewlines()<CR>\\begin{columns}<CR><CR>\\column{.\\textwidth}<CR><++><CR><CR>\\end{columns}<Esc>3k0f.a', { noremap = true, silent = true } )
