vim.cmd[[filetype indent off]]
vim.o.clipboard = vim.o.clipboard .. 'unnamedplus'
vim.o.path = vim.o.path .. '**'
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.wo.number = true
vim.wo.relativenumber = true
vim.o.undofile = true
vim.o.foldmethod = 'marker'
-- vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
vim.o.foldlevelstart = 99
vim.o.linebreak = true
vim.o.wildmode = 'longest:full'
vim.o.cursorline = true
vim.o.laststatus = 1
vim.o.completeopt = 'menuone,preview,noselect,noinsert'
vim.g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy'}
vim.o.ignorecase = true
vim.o.smartcase = true
vim.cmd('autocmd TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=200}')
vim.o.timeoutlen = 400
vim.o.conceallevel = 2
vim.o.showmode = false
vim.o.hlsearch = false
vim.o.title = true
vim.o.titleold = 'st'
vim.o.pumblend = 15
vim.o.shortmess = vim.o.shortmess .. 'I'
vim.o.fillchars = "eob: "

-- Colors
vim.o.termguicolors = true
vim.g.gruvpops_clearbg = 1

-- Set the content of the statusline
vim.o.statusline = ' %<%f %r %m %= %y %3.3p%% %3.3c%( %)'
-- Set the content of the ruler
vim.o.rulerformat = '%#Comment#%= %m %3.3p%% %3.3c'

local disabled_built_ins = {
   "2html_plugin",
   "fzf",
   "getscript",
   "getscriptPlugin",
   "gzip",
   "logipat",
   "netrw",
   "netrwPlugin",
   "netrwSettings",
   "netrwFileHandlers",
   "tar",
   "tarPlugin",
   "rrhelper",
   "vimball",
   "vimballPlugin",
   "zip",
   "zipPlugin",
}

for _, plugin in pairs(disabled_built_ins) do vim.g["loaded_" .. plugin] = 1 end
