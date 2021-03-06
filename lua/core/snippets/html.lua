local map = vim.api.nvim_buf_set_keymap
-- HTML
map(0, 'n', '<Space><Space>', '/<++><CR>"_cf>', { noremap = true, silent = true } )
map(0, 'i', '<Space><Space>', '<Esc>/<++><CR>"_cf>', { noremap = true, silent = true } )
map(0, 'i', ';d', '<div><CR></div><CR><++><Esc>kO<Tab>', { noremap = true, silent = true } )
map(0, 'i', ';e', '<em></em><++><Esc>F/hi', { noremap = true, silent = true } )
map(0, 'i', ';b', '<strong></strong><++><Esc>F/hi', { noremap = true, silent = true } )
map(0, 'i', ';t', '<title></title><++><Esc>F/hi', { noremap = true, silent = true } )
map(0, 'i', ';p', '<p><CR></p><CR><++><Esc>kO<Tab>', { noremap = true, silent = true } )
map(0, 'i', ';o', '<ol><CR></ol><CR><++><Esc>kO<Tab>', { noremap = true, silent = true } )
map(0, 'i', ';u', '<ul><CR></ul><CR><++><Esc>kO<Tab>', { noremap = true, silent = true } )
map(0, 'i', ';l', '<li></li><++><Esc>F/hi', { noremap = true, silent = true } )
map(0, 'i', ';a', '<a href=""><++></a><++><Esc>F"i', { noremap = true, silent = true } )
map(0, 'i', ';i', '<img src="" alt="<++>"><Esc>BF"i', { noremap = true, silent = true } )
map(0, 'i', ';1', '<h1></h1><++><Esc>F/hi', { noremap = true, silent = true } )
map(0, 'i', ';2', '<h2></h2><++><Esc>F/hi', { noremap = true, silent = true } )
map(0, 'i', ';3', '<h3></h3><++><Esc>F/hi', { noremap = true, silent = true } )
map(0, 'i', ';4', '<h4></h4><++><Esc>F/hi', { noremap = true, silent = true } )
map(0, 'i', ';5', '<h5></h5><++><Esc>F/hi', { noremap = true, silent = true } )
map(0, 'i', ';6', '<h6></h6><++><Esc>F/hi', { noremap = true, silent = true } )
