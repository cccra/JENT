local bind = vim.api.nvim_buf_set_keymap
-- Groff', { noremap = true, silent = true } )
bind(0, 'n', '<Space><Space>', '/<++><CR>"_cf>', { noremap = true, silent = true } )
bind(0, 'i', '<Space><Space>', '<Esc>/<++><CR>"_cf>', { noremap = true, silent = true } )
