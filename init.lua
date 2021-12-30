require('core.settings')
require('core.keymaps')
require('core.autocmds')
require('core.colours')

local install_path = vim.fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	print('Installing Packer to manage plugins...')
	INITIAL_INSTALL=vim.fn.system{'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path}
	vim.cmd('packadd packer.nvim')
	require('plugins.packer')
	require('packer').sync()
end
