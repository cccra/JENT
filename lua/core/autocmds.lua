-- Vertical help
function HelpfulHelp()
	if vim.opt.buftype:get(0) == 'help' then
		local columns = vim.opt.columns:get(0)
		local winwidth = vim.fn.winwidth(0)
		if ( winwidth >= 80 and columns >= 160 ) then
			vim.cmd("wincmd L | vert res 80")
			vim.wo.winfixwidth = true
		end
	end
end
vim.api.nvim_create_autocmd("BufEnter", { pattern = "*", callback = HelpfulHelp })

-- -- resize windows when vim is resized
-- vim.api.nvim_create_autocmd("VimResized" { pattern = "*", command = "wincmd =" })

-- Ensure files are read as what I want
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, { pattern = {"/tmp/calcurse*", "~/.calcurse/notes/*"},  command = "set filetype=markdown" })
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, { pattern = {"*.ms", "*.me", "*.mom", "*.man"},  command = "set filetype=groff" })
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, { pattern = "*.tex",  command = "set filetype=tex" })
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, { pattern = "*.norg",  command = "set filetype=norg" })

-- Disable line numbers for terminal
vim.api.nvim_create_autocmd("TermOpen", { pattern = "*",  command = "setlocal nonumber norelativenumber" })

-- Load snippets
vim.api.nvim_create_autocmd("FileType", { pattern = "tex", command = "lua require('core.snippets.tex') require('plugins.which-key.texkeys')" })
vim.api.nvim_create_autocmd("FileType", { pattern = "html", command = "lua require('core.snippets.html') require('plugins.which-key.htmlkeys')" })
vim.api.nvim_create_autocmd("FileType", { pattern = "groff", command = "lua require('core.snippets.ms') require('plugins.which-key.groffkeys')" })
vim.api.nvim_create_autocmd("BufRead", { pattern = "*.tex",  command = "syntax enable" })
vim.api.nvim_create_autocmd("InsertEnter", { pattern = "*.tex",  command = "set conceallevel=0" })
vim.api.nvim_create_autocmd("InsertLeave", { pattern = "*.tex",  command = "set conceallevel=2" })

-- Auto-load my templates for relevant new files
vim.api.nvim_create_autocmd("BufNewFile", { pattern = "*.tex",  command = "silent -1read " .. vim.fn.stdpath('config') .. "/templates/article.tex | exec search('^\\\\title') | norm $" })
vim.api.nvim_create_autocmd("BufNewFile", { pattern = "*.html",  command = "silent -1read " .. vim.fn.stdpath('config') .. "/templates/file.html | exec search('title') | norm f<" })
vim.api.nvim_create_autocmd("BufNewFile", { pattern = {"*.ms", "*.me", "*.mom", "*.man"},  command = "silent -1read " .. vim.fn.stdpath('config') .. "/templates/article.ms | norm 2j" })

-- Automatically deletes all trailing whitespace and blank lines at end of file on save
vim.api.nvim_create_autocmd("BufWritePre", { pattern = "*",  command = "%s/\\s\\+$//e" })
vim.api.nvim_create_autocmd("BufWritePre", { pattern = "*",  command = "%s/\\n\\+\\%$//e" })
--, vim.api.nvim_create_autocmd("BufWritePre" { pattern = "*.[ch]",  command = "%s/\\%$/\\r/e" })

-- Cleans out tex build files whenever I close out of a .tex file (requires external script)
vim.api.nvim_create_autocmd("VimLeave", { pattern = "*.tex",  command = "!texclear %" })

-- Run xrdb whenever Xdefaults or Xresources are updated
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, { pattern = {"Xresources", "Xdefaults", "xresources", "xdefaults"}, command = "set filetype=xdefaults" })
vim.api.nvim_create_autocmd("BufWritePost", { pattern = {"Xresources", "Xdefaults", "xresources", "xdefaults"}, command = "!xrdb %" })

-- Run make after editing dwmblocks config.h
vim.api.nvim_create_autocmd("BufWritePost", { pattern = "~/.local/src/dwmblocks/config.h", command = "!cd ~/.local/src/dwmblocks/;sudo make install && { killall -q dwmblocks;setsid -f dwmblocks }" })

-- Update shortcuts when shortcut files are updated (requires external script)
vim.api.nvim_create_autocmd("BufWritePost", { pattern = {"bm-files", "bm-dirs"}, command = "!shortcuts" })

-- Restart dunst when dunstrc updated
vim.api.nvim_create_autocmd("BufWritePost", { pattern = "dunstrc", command = "!killall -q dunst;setsid dunst &" })

-- Recompile packer on save
vim.api.nvim_create_autocmd("BufWritePost", { pattern = "~/.config/nvim/lua/plugins/packer/init.lua", command = "so | PackerCompile | lua print('Recompiled')" })

-- Disables automatic commenting on newline
vim.api.nvim_create_autocmd("FileType", { pattern = "*",  command = "setlocal formatoptions-=c formatoptions-=r formatoptions-=o" })
