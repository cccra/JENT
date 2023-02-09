-- add binaries installed by mason.nvim to path
local is_windows = vim.loop.os_uname().sysname == "Windows_NT"
vim.env.PATH = vim.env.PATH .. (is_windows and ";" or ":") .. vim.fn.stdpath "data" .. "/mason/bin"

-- commands
vim.cmd "silent! command! NvChadUpdate lua require('nvchad').update_nvchad()"
vim.cmd "silent! command! NvChadSnapshotCreate lua require('nvchad').snap_create()"
vim.cmd "silent! command! NvChadSnapshotDelete lua require('nvchad').snap_delete()"
vim.cmd "silent! command! NvChadSnapshotCheckout lua require('nvchad').snap_checkout()"

-- autocmds
local autocmd = vim.api.nvim_create_autocmd

-- dont list quickfix buffers
autocmd("FileType", {
  pattern = "qf",
  callback = function()
    vim.opt_local.buflisted = false
  end,
})

-- Close help buffer with q
autocmd("FileType", {
  pattern = "help",
  command = "nnoremap <buffer> q ZQ"
})

-- Vertical help
function HelpfulHelp()
	if vim.opt.buftype:get(0) == 'help' then
		local columns = vim.opt.columns:get(0)
		local winwidth = vim.fn.winwidth(0)
		if ( winwidth >= 80 and columns >= 160 ) then
			vim.cmd("wincmd L | vert res 82")
			vim.wo.winfixwidth = true
		end
	end
end

autocmd("BufEnter", { pattern = "*", callback = HelpfulHelp })

-- Highlight on yank
autocmd("TextYankPost", { pattern = "*", command = "silent! lua vim.highlight.on_yank {higroup='IncSearch', timeout=200}" })

-- Ensure files are read as what I want
autocmd({"BufRead", "BufNewFile"}, { pattern = {"/tmp/calcurse*", "/.calcurse/notes/*"},  command = "set filetype=markdown" })
autocmd({"BufRead", "BufNewFile"}, { pattern = {"*.ms", "*.me", "*.mom", "*.man"},  command = "set filetype=groff" })

-- Auto-load my templates for relevant new files
autocmd("BufNewFile", { pattern = "*.tex",  command = "silent -1read " .. vim.fn.stdpath('config') .. "/templates/article.tex | exec search('^\\\\title') | norm $" })
autocmd("BufNewFile", { pattern = "*.html",  command = "silent -1read " .. vim.fn.stdpath('config') .. "/templates/file.html | exec search('title') | norm f<" })
autocmd("BufNewFile", { pattern = {"*.ms", "*.me", "*.mom", "*.man"},  command = "silent -1read " .. vim.fn.stdpath('config') .. "/templates/article.ms | norm 2j" })

-- Automatically deletes all trailing whitespace and blank lines at end of file on save
autocmd("BufWritePre", { pattern = "*",  command = "%s/\\s\\+$//e" })
autocmd("BufWritePre", { pattern = "*",  command = "%s/\\n\\+\\%$//e" })
--, autocmd("BufWritePre" { pattern = "*.[ch]",  command = "%s/\\%$/\\r/e" })

-- Cleans out tex build files whenever I close out of a .tex file (requires external script)
autocmd("VimLeave", { pattern = "*.tex",  command = "!texclear %" })

-- Run xrdb whenever Xdefaults or Xresources are updated
autocmd({"BufRead", "BufNewFile"}, { pattern = {"Xresources", "Xdefaults", "xresources", "xdefaults"}, command = "set filetype=xdefaults" })
autocmd("BufWritePost", { pattern = {"Xresources", "Xdefaults", "xresources", "xdefaults"}, command = "!xrdb %" })

-- Run make after editing dwmblocks config.h
autocmd("BufWritePost", { pattern = "*dwmblocks/config.h", command = "!cd ~/.local/src/dwmblocks/;sudo make install && { killall -q dwmblocks;setsid -f dwmblocks }" })

-- Update shortcuts when shortcut files are updated (requires external script)
autocmd("BufWritePost", { pattern = {"bm-files", "bm-dirs"}, command = "!shortcuts" })

-- Restart dunst when dunstrc updated
autocmd("BufWritePost", { pattern = "dunstrc", command = "!killall -q dunst;setsid dunst &" })

-- Recompile packer on save
autocmd("BufWritePost", { pattern = "/.config/nvim/lua/plugins/packer/init.lua", command = "so | PackerCompile | lua print('Recompiled')" })

-- Disables automatic commenting on newline
autocmd("FileType", { pattern = "*",  command = "setlocal formatoptions-=c formatoptions-=r formatoptions-=o" })
