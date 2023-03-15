local map = vim.api.nvim_set_keymap
local default_opts = {noremap = true, silent = true}

map('i', 'jk', '<Esc>', {noremap = true})

-- Disable arrows
map('', '<up>', ':echoe "Use k"<CR>', {noremap = true, silent = false})
map('', '<down>', ':echoe "Use j"<CR>', {noremap = true, silent = false})
map('', '<left>', ':echoe "Use h"<CR>', {noremap = true, silent = false})
map('', '<right>', ':echoe "Use l"<CR>', {noremap = true, silent = false})

-- CTRL-s saving
map('n', '<C-s>', ':w<CR>',  default_opts)
map('i', '<C-s>', '<esc>:w<CR>', default_opts)

-- Tabs switching
map('n', 'H', 'gT', default_opts)
map('n', 'L', 'gt', default_opts)

-- Hide search higlighting
map('n', ',<space>', ':nohlsearch<CR>', default_opts)
