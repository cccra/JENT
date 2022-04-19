-- Colours {{{
local colors = {
	bg0 = '#131111',
	bg1 = '#191717',
	bg2 = '#292727',
	bg3 = '#443c39',
	bg4 = '#665c54',
	bg5 = '#7c6f64',

	fg0 = '#ebdbb2',
	fg1 = '#bdae93',

	gray = '#928374',

	red = '#ea6962',
	green = '#7cd87c',
	yellow = '#ffb64d',
	blue = '#7daea3',
	purple = '#d3869b',
	aqua = '#89b482',
	orange = '#f28534',

	h1 = '#ffb64d',
	h2 = '#f38b35',
	h3 = '#ee5634',
	h4 = '#e24b81',
	h5 = '#e25ad1',
	h6 = '#bd7ed8',
} --}}}

-- Terminal Colours {{{
vim.g.terminal_color_0 = colors.bg0
vim.g.terminal_color_8 = colors.gray
vim.g.terminal_color_9 = colors.red
vim.g.terminal_color_10 = colors.green
vim.g.terminal_color_11 = colors.yellow
vim.g.terminal_color_12 = colors.blue
vim.g.terminal_color_13 = colors.purple
vim.g.terminal_color_14 = colors.aqua
vim.g.terminal_color_15 = colors.fg0
--}}}

local highlight = function(group, fg, bg, attr, sp)
    fg = fg and 'guifg=' .. fg or 'guifg=NONE'
    bg = bg and 'guibg=' .. bg or 'guibg=NONE'
    attr = attr and 'gui=' .. attr or 'gui=NONE'
	sp = sp and 'guisp=' .. sp or ''
    vim.api.nvim_command('highlight ' .. group .. ' ' .. fg .. ' ' .. bg .. ' ' .. attr .. ' ' .. sp)
end

if vim.fn.exists('g:gruvpops_clearbg') then
	if (vim.g.gruvpops_clearbg == 1) then
		Gruvpops_bg = 'nil'
	else
		Gruvpops_bg = colors.bg0
	end
end

-- highlight(Group, Foreground, Backgroud, Attribute, Special)
-- General UI {{{
highlight('Cursor', nil, nil, 'inverse', nil)
highlight('vCursor', nil, nil, 'inverse', nil)
highlight('iCursor', nil, nil, 'inverse', nil)
highlight('lCursor', nil, nil, 'inverse', nil)
highlight('CursorLine', nil, colors.bg1, nil, nil)
highlight('CursorColumn', nil, colors.bg1, nil, nil)
highlight('Normal', colors.fg0, Gruvpops_bg, nil, nil)
highlight('TabLine', colors.bg5, colors.bg2, nil, nil)
highlight('TabLineFill', nil, colors.bg2, nil, nil)
highlight('TabLineSel', colors.green, colors.bg2, nil, nil)
highlight('MatchParen', colors.red, colors.bg2, 'bold', nil)
highlight('Conceal', colors.blue, nil, nil, nil)
highlight('NonText', colors.bg3, nil, nil, nil)
highlight('SpecialKey', colors.bg3, nil, nil, nil)
highlight('Visual', nil, colors.bg3,nil, nil)
highlight('VisualNOS', nil, colors.bg4, 'inverse', nil)
highlight('Search', colors.yellow, colors.bg0, 'inverse', nil)
highlight('IncSearch', colors.orange, colors.bg0, 'inverse', nil)
highlight('Underlined', nil, nil, 'underline', nil)
highlight('StatusLine', colors.bg2, colors.fg1, 'inverse', nil)
highlight('StatusLineNC', colors.bg2, colors.bg4, 'inverse', nil)
highlight('VertSplit', colors.bg3, nil, nil, nil)
highlight('WildMenu', colors.blue, colors.bg3, nil, nil)
highlight('Directory', colors.green, nil, 'bold', nil)
highlight('Title', colors.green, nil, 'bold', nil)
highlight('ErrorMsg', colors.red, nil, 'bold,inverse', nil)
highlight('MoreMsg', colors.yellow, nil, 'bold', nil)
highlight('ModeMsg', colors.yellow, nil, 'bold', nil)
highlight('Question', colors.orange, nil, 'bold', nil)
highlight('WarningMsg', colors.red, nil, 'bold', nil)
--}}}
-- Gutter {{{
highlight('LineNr', colors.bg5, nil, nil, nil)
highlight('CursorLineNr', colors.yellow, colors.bg2, 'bold', nil)
highlight('SignColumn', nil, colors.bg2, nil, nil)
highlight('Folded', colors.fg1, nil, 'italic', nil)
highlight('FoldColumn', colors.fg1, nil, 'italic', nil)
highlight('EndOfBuffer', colors.bg3, nil, nil, nil)
--}}}
-- Syntax {{{
highlight('Special', colors.orange, nil, nil, nil)
highlight('Comment', colors.gray, nil, 'italic', nil)
highlight('Todo', colors.fg0, nil, 'bold,italic', nil)
highlight('Error', colors.red, nil, 'bold,inverse', nil)
highlight('Statement', colors.red, nil, nil, nil)
highlight('Conditional', colors.red, nil, nil, nil)
highlight('Repeat', colors.red, nil, nil, nil)
highlight('Label', colors.red, nil, nil, nil)
highlight('Exception', colors.red, nil, nil, nil)
highlight('Operator', colors.fg0, nil, nil, nil)
highlight('Keywords', colors.red, nil, nil, nil)
highlight('Identifier', colors.blue, nil, nil, nil)
highlight('Function', colors.green, nil, 'bold', nil)
highlight('PreProc', colors.aqua, nil, nil, nil)
highlight('Include', colors.aqua, nil, nil, nil)
highlight('Define', colors.aqua, nil, nil, nil)
highlight('Macro', colors.aqua, nil, nil, nil)
highlight('PreCondit', colors.aqua, nil, nil, nil)
highlight('Constant', colors.purple, nil, nil, nil)
highlight('Character', colors.purple, nil, nil, nil)
highlight('String', colors.green, nil, nil, nil)
highlight('Boolean', colors.purple, nil, nil, nil)
highlight('Number', colors.purple, nil, nil, nil)
highlight('Float', colors.purple, nil, nil, nil)
highlight('Type', colors.yellow, nil, nil, nil)
highlight('StorageClass', colors.orange, nil, nil, nil)
highlight('Structure', colors.aqua, nil, nil, nil)
highlight('TypeDef', colors.yellow, nil, nil, nil)
--}}}
-- Completion {{{
highlight('Pmenu', colors.fg0, colors.bg2, nil, nil)
highlight('PmenuSel', colors.bg3, colors.blue, nil, nil)
highlight('PmenuSbar', colors.gray, colors.bg2, nil, nil)
highlight('PmenuThumb', nil, colors.bg3, nil, nil)
--}}}
-- Diffs {{{
highlight('DiffDelete', colors.red, nil, 'inverse', nil)
highlight('DiffAdd', colors.green, nil, 'inverse', nil)
highlight('DiffChange', colors.aqua, nil, 'inverse', nil)
highlight('DiffText', colors.yellow, nil, 'inverse', nil)
--}}}
-- Spelling {{{
highlight('SpellCap', colors.blue, colors.bg0, 'bold,inverse', nil)
highlight('SpellBad', colors.red, colors.bg0, 'bold,inverse', nil)
highlight('SpellLocal', colors.green, colors.bg0, 'bold,inverse', nil)
highlight('SpellRare', nil, nil, 'undercurl', nil)
--}}}

-- TreeSitter {{{
-- highlight('TSError', colors.red, nil, nil, nil)
highlight('TSPunctDelimiter', colors.gray, nil, nil, nil)
highlight('TSPunctBracket', colors.orange, nil, nil, nil)
highlight('TSPunctSpecial', colors.orange, nil, nil, nil)
highlight('TSConstant', colors.purple, nil, nil, nil)
highlight('TSConstantBuiltin', colors.purple, nil, nil, nil)
highlight('TSConstMacro', colors.aqua, nil, nil, nil)
highlight('TSStringRegex', colors.red, nil, nil, nil)
highlight('TSString', colors.green, nil, nil, nil)
highlight('TSStringEscape', colors.aqua, nil, nil, nil)
highlight('TSCharacter', colors.green, nil, nil, nil)
highlight('TSNumber', colors.purple, nil, nil, nil)
highlight('TSBoolean', colors.purple, nil, nil, nil)
highlight('TSFloat', colors.green, nil, nil, nil)
highlight('TSAnnotation', colors.yellow, nil, nil, nil)
highlight('TSAttribute', colors.aqua, nil, nil, nil)
highlight('TSNamespace', colors.red, nil, nil, nil)
highlight('TSFuncBuiltin', colors.aqua, nil, nil, nil)
highlight('TSFunction', colors.green, nil, 'bold', nil)
highlight('TSFuncMacro', colors.aqua, nil, nil, nil)
highlight('TSParameter', colors.blue, nil, nil, nil)
highlight('TSParameterReference', colors.orange, nil, nil, nil)
highlight('TSMethod', colors.green, nil, nil, nil)
highlight('TSField', colors.blue, nil, nil, nil)
highlight('TSProperty', colors.fg0, nil, nil, nil)
highlight('TSConstructor', colors.orange, nil, nil, nil)
highlight('TSConditional', colors.red, nil, nil, nil)
highlight('TSRepeat', colors.red, nil, nil, nil)
highlight('TSLabel', colors.aqua, nil, nil, nil)
highlight('TSKeyword', colors.red, nil, nil, nil)
highlight('TSKeywordFunction', colors.red, nil, nil, nil)
highlight('TSKeywordOperator', colors.red, nil, nil, nil)
highlight('TSOperator', colors.fg0, nil, nil, nil)
highlight('TSException', colors.purple, nil, nil, nil)
highlight('TSType', colors.yellow, nil, nil, nil)
highlight('TSTypeBuiltin', colors.aqua, nil, 'italic', nil)
highlight('TSStructure', colors.purple, nil, nil, nil)
highlight('TSInclude', colors.red, nil, nil, nil)
highlight('TSVariable', colors.fg0, nil, nil, nil)
highlight('TSVariableBuiltin', colors.purple, nil, nil, nil)
highlight('TSText', colors.grey, nil, nil, nil)
highlight('TSStrong', nil, nil, 'bold', nil)
highlight('TSEmphasis', nil, nil, 'italic', nil)
highlight('TSUnderline', nil, nil, 'underline', nil)
highlight('TSTitle', colors.green, nil, 'bold', nil)
highlight('TSLiteral', colors.orange, nil, nil, nil)
highlight('TSURI', colors.blue, nil, nil, nil)
highlight('TSTag', colors.aqua, nil, nil, nil)
highlight('TSTagDelimiter', colors.fg0, nil, nil, nil)
--}}}

-- LSP {{{
highlight('LspDiagnosticsDefaultError', colors.red, nil, nil, nil)
highlight('LspDiagnosticsDefaultWarning', colors.yellow, nil, nil, nil)
highlight('LspDiagnosticsDefaultInformation', colors.blue, nil, nil, nil)
highlight('LspDiagnosticsDefaultHint', colors.aqua, nil, nil, nil)
highlight('LspDiagnosticsUnderlineError', colors.red, nil, 'undercurl', nil)
highlight('LspDiagnosticsUnderlineWarning', colors.yellow, nil, 'undercurl', nil)
highlight('LspDiagnosticsUnderlineInformation', colors.blue, nil, 'undercurl', nil)
highlight('LspDiagnosticsUnderlineHint', colors.aqua, nil, 'undercurl', nil)
highlight('LspReferenceText', colors.yellow, colors.bg1, nil, nil)
highlight('LspReferenceRead', colors.yellow, colors.bg1, nil, nil)
highlight('LspReferenceWrite', colors.yellow, colors.bg1, nil, nil)
--}}}

-- LANGUAGES
-- HTML {{{
highlight('htmlBold', nil, nil, 'bold', nil)
highlight('htmlItalic', nil, nil, 'italic', nil)
highlight('htmlLink', colors.blue, nil, 'underline', nil)
highlight('htmlTitle', colors.yellow, nil, nil, nil)
highlight('htmlH1', colors.h1, nil, nil, nil)
highlight('htmlH2', colors.h2 , nil, nil, nil)
highlight('htmlH3', colors.h3, nil, nil, nil)
highlight('htmlH4', colors.h4, nil, nil, nil)
highlight('htmlH5', colors.h5, nil, nil, nil)
highlight('htmlH6', colors.h6, nil, nil, nil)
---}}}

-- PLUGINS
-- IndentBlankine {{{
highlight('IndentBlanklineChar', '#484646', nil, nil, nil)
--}}}
-- Neorg {{{
highlight('Heading1', colors.h1, nil, 'bold', nil)
highlight('Heading2', colors.h2, nil, 'bold', nil)
highlight('Heading3', colors.h3, nil, 'bold', nil)
highlight('Heading4', colors.h4, nil, 'bold', nil)
highlight('Heading5', colors.h5, nil, 'bold', nil)
highlight('Heading6', colors.h6, nil, 'bold', nil)
--}}}
-- Illuminate {{{
highlight('illuminatedWord', colors.yellow, colors.bg2, 'bold', nil)
highlight('illuminatedCurWord', nil, nil, nil, nil)
--}}}
-- Neogit {{{
highlight('NeogitDiffAddHighlight', nil, colors.bg1, 'bold', nil)
highlight('NeogitDiffDeleteHighlight', nil, colors.bg1, 'bold', nil)
highlight('NeogitDiffContextHighlight', nil, colors.bg1, nil, nil)
highlight('NeogitHunkHeader', colors.yellow, colors.bg2, nil, nil)
highlight('NeogitHunkHeaderHighlight', colors.yellow, colors.bg2, 'bold', nil)
--}}}
