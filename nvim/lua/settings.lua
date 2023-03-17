local cmd = vim.cmd             -- execute Vim commands
local exec = vim.api.nvim_exec  -- execute Vimscript
local g = vim.g                 -- global variables
local opt = vim.opt             -- global/buffer/windows-scoped options

-- Tabs settings
g.tagbar_compact = 1
g.tagbar_sort = 0

g.netrw_banner = 0              -- hide banner above files
g.netrw_liststyle = 3           -- hide instead of plain view
g.netrw_browse_split = 3        -- open file in new tab

g.indentLine_char = ''
g.indentLine_first_char = ''
g.indentLine_showFirstIndentLevel = 1
g.indentLine_setColors = 0

-- Base settings
opt.mouse = a
opt.autochdir = true
opt.cursorline = true
opt.number = true
opt.relativenumber = true
opt.scrolloff = 7
opt.swapfile = false
opt.colorcolumn = "80"

opt.encoding = 'utf-8'
opt.fileformat = unix

-- <Tab> behavior
cmd([[
  filetype indent plugin on
  syntax enable
]])
opt.expandtab = true      -- use spaces instead of tabs
opt.shiftwidth = 4        -- shift 4 spaces when tab
opt.tabstop = 4           -- 1 tab == 4 spaces
opt.smartindent = true    -- autoindent new lines
opt.autoindent = true

-- don't auto commenting new lines
cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]

-- remove line lenght marker for selected filetypes
cmd [[autocmd FileType text,markdown,html,xhtml,javascript setlocal cc=0]]

-- 2 spaces for selected filetypes
cmd [[
  autocmd FileType xml,html,xhtml,css,scss,javascript,lua,yaml,htmljinja setlocal shiftwidth=2 tabstop=2
]]

-- html & jinja2
cmd[[ autocmd BufNewFile,BufRead *.html set filetype=htmldjango ]]

-- Remember last position
cmd [[
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
]]

-- Higlight seleted
exec([[
  augroup YankHighlight
  autocmd!
  autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
  augroup end
]], false)

-- Colors
vim.cmd([[
  hi CursorLine cterm=NONE ctermbg=236
  hi ColorColumn cterm=NONE ctermbg=236
  hi MatchParen cterm=NONE ctermbg=grey ctermfg=black
]])
