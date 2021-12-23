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
vim.cmd("autocmd BufEnter * lua HelpfulHelp()")

-- resize windows when vim is resized
vim.cmd("autocmd VimResized * wincmd =")

-- Ensure files are read as what I want
vim.cmd("autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown")
vim.cmd("autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff")
vim.cmd("autocmd BufRead,BufNewFile *.tex set filetype=tex")
vim.cmd("autocmd BufRead,BufNewFile *.norg set filetype=norg")

-- Disable line numbers for terminal
vim.cmd("autocmd TermOpen * setlocal nonumber norelativenumber")

-- Load snippets
vim.cmd("autocmd FileType tex lua require('snippets.tex') require('which-key-conf.texkeys')")
vim.cmd("autocmd FileType html lua require('snippets.html') require('which-key-conf.htmlkeys')")
vim.cmd("autocmd FileType groff lua require('snippets.ms') require('which-key-conf.groffkeys')")
vim.cmd("autocmd BufRead *.tex syntax enable")
vim.cmd("autocmd InsertEnter *.tex set conceallevel=0")
vim.cmd("autocmd InsertLeave *.tex set conceallevel=2")

-- Auto-load my templates for relevant new files
vim.cmd("autocmd BufNewFile *.tex silent -1read $HOME/.local/share/templates/article.tex | %foldo | exec search('^\\\\title') | norm $")
vim.cmd("autocmd BufNewFile *.html silent -1read $HOME/.local/share/templates/file.html | exec search('title') | norm f<")
vim.cmd("autocmd BufNewFile *.ms,*.me,*.mom,*.man silent -1read $HOME/.local/share/templates/article.ms | norm 2j")

-- Automatically deletes all trailing whitespace and blank lines at end of file on save
vim.cmd("autocmd BufWritePre * %s/\\s\\+$//e")
vim.cmd("autocmd BufWritePre * %s/\\n\\+\\%$//e")
-- vim.cmd("autocmd BufWritePre *.[ch] %s/\\%$/\\r/e")

-- Cleans out tex build files whenever I close out of a .tex file (requires external script)
vim.cmd("autocmd VimLeave *.tex !texclear %")

-- Run xrdb whenever Xdefaults or Xresources are updated
vim.cmd("autocmd BufRead,BufNewFile Xresources,Xdefaults,xresources,xdefaults set filetype=xdefaults")
vim.cmd("autocmd BufWritePost Xresources,Xdefaults,xresources,xdefaults !xrdb %")

-- Run make after editing dwmblocks config.h
vim.cmd("autocmd BufWritePost ~/.local/src/dwmblocks/config.h !cd ~/.local/src/dwmblocks/;sudo make install && { killall -q dwmblocks;setsid -f dwmblocks }")

-- Update shortcuts when shortcut files are updated (requires external script)
vim.cmd("autocmd BufWritePost bm-files,bm-dirs !shortcuts")

-- Restart dunst when dunstrc updated
vim.cmd("autocmd BufWritePost dunstrc !killall -q dunst;setsid dunst &")

-- Recompile packer on save
vim.cmd("autocmd BufWritePost ~/.config/nvim/lua/plugins.lua so | PackerCompile | lua print('Recompiled')")

-- Disables automatic commenting on newline
vim.cmd("autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o")
