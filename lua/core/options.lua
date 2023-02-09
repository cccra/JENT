local opt = vim.opt
local g = vim.g
local config = require("core.utils").load_config()

g.nvchad_theme = config.ui.theme
g.toggle_theme_icon = "   "
g.transparency = config.ui.transparency
g.theme_switcher_loaded = false

opt.laststatus = 1 -- global statusline
opt.showmode = false
opt.showcmd = false

opt.clipboard:append "unnamedplus"
opt.cursorline = true

-- Indenting
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2

opt.fillchars = { eob = " " }
opt.ignorecase = true
opt.smartcase = true
opt.mouse = "a"

-- Numbers
opt.number = true
opt.relativenumber = true
opt.numberwidth = 2

-- Set the content of the statusline
opt.statusline = ' %<%f %r %m %= %y %3.3p%% %3.3c%( %)'
-- Set the content of the ruler
opt.rulerformat = '%#Comment#%= %r %m %3.3p%% %3.3c'

-- disable nvim intro
opt.shortmess:append "sI"

opt.signcolumn = "yes"
opt.termguicolors = true
opt.timeoutlen = 400
opt.undofile = true
opt.undodir = { "/home/gus/.cache/nvim/undo//" }

-- interval for writing swap file to disk, also used by gitsigns
opt.updatetime = 250

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append "<>[]hl"
opt.linebreak = true

-- enable treesitter folding
opt.foldmethod = 'expr'
opt.foldexpr = 'nvim_treesitter#foldexpr()'
opt.foldlevelstart = 99

-- selection menus
opt.wildmode = 'longest:full'
opt.completeopt = 'menuone,preview,noselect,noinsert'
-- vim.opt_global.completion_matching_strategy_list = { 'exact', 'substring', 'fuzzy' }

opt.conceallevel = 2
opt.hlsearch = false
opt.title = true
opt.titleold = 'st'

g.mapleader = " "

-- disable some builtin vim plugins
local default_plugins = {
  "2html_plugin",
  "getscript",
  "getscriptPlugin",
  "gzip",
  "logipat",
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "matchit",
  "tar",
  "tarPlugin",
  "rrhelper",
  "spellfile_plugin",
  "vimball",
  "vimballPlugin",
  "zip",
  "zipPlugin",
  "tutor",
  "rplugin",
  "syntax",
  "synmenu",
  "optwin",
  "compiler",
  "bugreport",
  "ftplugin",
}

for _, plugin in pairs(default_plugins) do
  g["loaded_" .. plugin] = 1
end

local default_providers = {
  "node",
  "perl",
  "python3",
  "ruby",
}

for _, provider in ipairs(default_providers) do
  vim.g["loaded_" .. provider .. "_provider"] = 0
end
