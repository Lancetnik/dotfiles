set mouse=a  " enable mouse
set encoding=utf-8
set number
set noswapfile
set scrolloff=7

let g:netrw_banner = 0 " hide banner above files
let g:netrw_liststyle = 3 " hide instead of plain view
let g:netrw_browse_split = 3 " open file in new tab

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set fileformat=unix
filetype indent on      " load filetype-specific indent files

set termguicolors

inoremap jk <esc>

" Tab switching by H & L
nnoremap H gT
nnoremap L gt

call plug#begin('~/.vim/plugged')

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'L3MON4D3/LuaSnip'

" Search
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

" For JS/JSX
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'

call plug#end()

" Telescope
lua << EOF
require('telescope').load_extension('fzf')
EOF
nnoremap ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap fg <cmd>lua require('telescope.builtin').live_grep()<cr>

" LSP
hi DiagnosticError guifg=White
hi DiagnosticWarn guifg=White
