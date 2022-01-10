local map = vim.api.nvim_set_keymap
vim.g.mapleader = ' '

-- SEARCHING

-- press <Esc> to temporarily unhighlight search results
map('n', '<Esc>', ':noh<CR><Esc>', { noremap = true, silent = true })
-- Toggle highlighting of search results
map('n', '<F3>', ':set hlsearch! <bar> :set hlsearch?<CR>', { noremap = true, silent = true })
-- Toggle case sensitivity
map('n', '<F2>', ':set ignorecase! <bar> :set smartcase! <bar> :set ignorecase?<CR>', { noremap = true, silent = true })

-- ANNOYANCES

-- Do not yank when 'changing'
map('n', 'c', '"_c', { noremap = true, silent = true })

-- Keep selection when indenting a visual block
map('v', '<', '<gv', { silent = true })
map('v', '>', '>gv', { silent = true })

-- Perform dot commands over visual blocks
map('v', '.', ':normal .<CR>', { noremap = true, silent = true })

-- Undo break points
map('i', ',', ',<c-g>u', { noremap = true })
map('i', '.', '.<c-g>u', { noremap = true })
map('i', '?', '?<c-g>u', { noremap = true })
map('i', '!', '!<c-g>u', { noremap = true })
map('i', ':', ':<c-g>u', { noremap = true })
map('i', '"', '"<c-g>u', { noremap = true })
map('i', '(', '(<c-g>u', { noremap = true })
map('i', ')', ')<c-g>u', { noremap = true })

-- Close help and netrw buffer with q
vim.cmd("autocmd FileType help nnoremap <buffer> q ZQ")
vim.cmd("autocmd FileType netrw nnoremap <buffer> q ZQ")

-- PLUGIN BINDINGS

-- Telescope
function EditConfig()
	if not (vim.fn.join(vim.fn.getline(1,'$'), "\n") == "") then
		vim.cmd("tabnew")
	end
	vim.cmd("lua require('telescope.builtin').find_files({prompt_title = 'Vim Config', cwd = vim.fn.stdpath('config')})")
end
map('n', '<leader>ff', ":lua require('telescope.builtin').find_files({find_command = {'rg', '--files', '--hidden', '--no-ignore', '--ignore-file', '.config/nvim/lua/plugins/telescope/ignore'}})<CR>", { noremap = true, silent = true })
map('n', '<leader>fb', ":lua require('telescope.builtin').buffers()<CR>", { noremap = true, silent = true })
map('n', '<leader>fs', ":lua require('telescope.builtin').live_grep()<CR>", { noremap = true, silent = true })
map('n', '<leader>fr', ":lua require('telescope.builtin').oldfiles()<CR>", { noremap = true, silent = true })
map('n', '<leader>fc', ":lua EditConfig()<CR>", { noremap = true, silent = true })
-- zen-mode
map('n', '<leader>d', ':ZenMode<CR>', { noremap = true, silent = true })
-- mundo
map('n', '<leader>u', ':MundoToggle<CR>',  { noremap = true, silent = true })
-- neogit
map('n', '<leader>g', ':Neogit<CR>',  { noremap = true, silent = true })
-- packer
map('n', '<leader>p', ':PackerSync<CR>', { noremap = true, silent = true })
-- nvim-colorizer
map('n', '<leader>h', ':ColorizerToggle<CR>', { noremap = true, silent = true })
-- neorg
map('n', '<leader>nn', ':PackerLoad nvim-cmp neorg<CR>:e ~/dox/.notes/index.norg<CR>', { noremap = true, silent = true })
map('n', '<leader>nt', ':PackerLoad nvim-cmp neorg<CR>:e ~/dox/.todo/index.norg<CR>', { noremap = true, silent = true })
--lsp
map('n', '<leader>lc', ':lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true })
map('n', '<leader>ln', ':lua vim.diagnostic.goto_next()<CR>', { noremap = true, silent = true })
map('n', '<leader>lp', ':lua vim.diagnostic.goto_prev()<CR>', { noremap = true, silent = true })
map('n', '<c-n>', ':lua vim.diagnostic.goto_next()<CR>', { noremap = true, silent = true })
map('n', '<c-p>', ':lua vim.diagnostic.goto_prev()<CR>', { noremap = true, silent = true })
map('n', '<leader>lm', ':LspInstallInfo<CR>', { noremap = true, silent = true })
map('n', '<leader>li', ':LspInfo<CR>', { noremap = true, silent = true })


-- BINDINGS

-- update Jent config
function UpdateJent()
	print("Downloading the latest Jent...")
	vim.fn.system{'git', '-C', '${XDG_CONFIG_HOME:-$HOME/.config}/nvim', 'pull'}
	require('plugins.packer')
	require('packer').sync()
end
map('n', '<leader>j', ':lua UpdateJent()<CR>', { noremap = true, silent = true })

-- Change current character changed to ss to avoid vim-sandwich conflict
map('n', 'ss', 's', { noremap = true })

-- Replace all is aliased to S
map('n', 'S', ':%s//g<Left><Left>', { noremap = true })

-- Clean up youtube-dl filenames (for use with vidir)
map('n', '<C-S>', ':%s/-\\S*\\./\\./g', { noremap = true })

-- Spell-check set to <leader>o, 'o' for 'orthography'
map('n', '<leader>s', ':setlocal spell! spelllang=en_gb<CR>', { silent = true })

-- Compile document, be it groff/LaTeX/markdown/etc (requires external script)
map('n', '<leader>c', ':w! | !compiler "<c-r>%"<CR>', { silent = true })

-- Open corresponding .pdf/.html (requires external script)
map('n', '<leader>o', ':!opout <c-r>%<CR><CR>', { silent = true })

-- Notify-send word count (requires external script)
-- map('n', '<leader>w', ':!wdcount <c-r>%<CR><CR>', { silent = true })

-- Open LaTeX bibliography file in split
map('n', '<leader>bb', ':vsp<space>$BIB<CR>', { silent = true })

-- Open groff bibliography file in split
map('n', '<leader>br', ':vsp<space>$REFER<CR>', { silent = true })

-- Save file as sudo on files that require root permission
map('c', 'w!!', 'execute \'silent! write !sudo tee % >/dev/null\' <bar> edit!', { noremap = true })

-- -- Reload Vim config
-- map('n', '<leader>r', ':luafile $MYVIMRC<CR>', { noremap = true, silent = true })

-- Toggle clear background
function BackgroundToggle()
	if vim.g.gruvpops_clearbg == 0 then
		vim.g.gruvpops_clearbg = 1
	else
		vim.g.gruvpops_clearbg = 0
	end
	vim.cmd("luafile " .. vim.fn.stdpath('config') .. "/lua/core/colours.lua")
end
map('n', '<leader>k', ':lua BackgroundToggle()<CR>', { noremap = true, silent = true })

-- Replace ex mode with gq
map('n', 'Q', 'gq', { silent = true })

-- Shorter split navigation, saving a keypress
map('n', '<C-h>', '<C-w>h', { silent = true })
map('n', '<C-j>', '<C-w>j', { silent = true })
map('n', '<C-k>', '<C-w>k', { silent = true })
map('n', '<C-l>', '<C-w>l', { silent = true })

-- Make adjusting split sizes a bit more friendly (but still unintuitive)
map('n', '<C-Left>', ':vertical resize +3<CR>', { noremap = true, silent = true })
map('n', '<C-Right>', ':vertical resize -3<CR>', { noremap = true, silent = true })
map('n', '<C-Up>', ':resize +3<CR>', { noremap = true, silent = true })
map('n', '<C-Down>', ':resize -3<CR>', { noremap = true, silent = true })

-- Tabs
map('n', '<leader><Tab>n', ':tabnew<CR>', { noremap = true, silent = true })
map('n', '<leader><Tab>e', ":tabnew<CR>:lua require('telescope.builtin').find_files({no_ignore = true})<CR>", { noremap = true, silent = true })
map('n', '<leader><Tab>c', ':tabclose<Space><CR>', { noremap = true, silent = true })
map('n', '<leader><Tab>o', ':tabonly<CR>', { noremap = true, silent = true })

-- Import a template
map('n', '<leader>tl', ':-1read<Space>~/.config/nvim/templates/article.tex<CR>:set<Space>filetype=tex<CR>/^\\\\title<CR>f{a', { noremap = true, silent = true })
map('n', '<leader>tb', ':-1read<Space>~/.config/nvim/templates/beamer.tex<CR>:set<Space>filetype=tex<CR>/^\\\\title<CR>f{a', { noremap = true, silent = true })
map('n', '<leader>tg', ':-1read<Space>~/.config/nvim/templates/article.ms<CR>:set<Space>filetype=groff<CR>/^\\.TL<CR>ji', { noremap = true, silent = true })
map('n', '<leader>th', ':-1read<Space>~/.config/nvim/templates/file.html<CR>:set<Space>filetype=html<CR>3jf>a', { noremap = true, silent = true })

-- Fix annoyances

-- Do not yank when 'changing'
	map('n', 'c', '"_c', { noremap = true })
	map('n', 'C', '"_C', { noremap = true })

-- Keep selection when indenting a visual block
	map('v', '<', '<gv', { silent = true })
	map('v', '>', '>gv', { silent = true })

-- Perform dot commands over visual blocks
	map('v', '.', ':normal .<CR>', { noremap = true, silent = true })
