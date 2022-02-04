local lsp_installer = require "nvim-lsp-installer"

-- Include the servers you want to have installed by default below
local servers = {
	"bashls",
	"pyright",
	"texlab",
	"sumneko_lua",
	"cssls",
	"html",
	"clangd",
}

for _, name in pairs(servers) do
	local server_is_found, server = lsp_installer.get_server(name)
	if server_is_found then
		if not server:is_installed() then
			print("Installing " .. name)
			server:install()
		end
	end
end

local function on_attach(client, bufnr)
	-- Set up buffer-local keymaps (vim.api.nvim_buf_set_keymap()), etc.
	require 'illuminate'.on_attach(client)
end

lsp_installer.on_server_ready(function(server)
	-- Specify the default options which we'll use to setup all servers
	local default_opts = {
	on_attach = on_attach,
	capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
	}

	-- Now we'll create a server_opts table where we'll specify our custom LSP server configuration
	local server_opts = {
		-- Provide settings that should only apply to the "eslintls" server
		["sumneko_lua"] = function()
			default_opts.settings = {
				Lua = {
					runtime = {
						-- LuaJIT in the case of Neovim
						version = 'LuaJIT',
						path = vim.split(package.path, ';'),
					},
					diagnostics = {
						-- Get the language server to recognize the `vim` global
						globals = {'vim', 'use'},
					},
					workspace = {
						-- Make the server aware of Neovim runtime files
						library = {
							[vim.fn.expand('$VIMRUNTIME/lua')] = true,
							[vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
						},
					},
				}
			}
		end,
	}

	-- Use the server's custom settings, if they exist, otherwise default to the default options
	local server_options = server_opts[server.name] and server_opts[server.name]() or default_opts
	server:setup(server_options)
end)
