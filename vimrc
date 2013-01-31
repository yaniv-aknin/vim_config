" {{{ Preamble
set nocompatible
execute pathogen#infect()
syntax on
filetype plugin on
" }}}

" {{{ Options
color desert

let g:netrw_home = expand('~/.vim')

" four character wide indentations; indent with spaces
set tabstop=4 shiftwidth=4 expandtab

" no swaps, no backups
set directory=~/.vim/swaps
set backupdir=~/.vim/backups

" don't auto-continue comments
autocmd FileType * setlocal formatoptions-=ro
" Always show tab bar
set showtabline=2

" highlight matching braces for 5/10 second after typing
set showmatch
set mat=5 " 

" incremental search, highlight search
set incsearch
set hlsearch
" }}}


" {{{ General bindings
" set a mapleader for alternative keyboard realestate
let mapleader = ","

" map ,c to enable system clipboard; ,C to disable
nmap <leader>c :set clipboard=unnamed<CR>
nmap <leader>C :set clipboard=<CR>

" map ,8 to highlight the 80th column
nnoremap <leader>8 :if &colorcolumn <bar> set colorcolumn& <bar> else <bar> set colorcolumn=80 <bar> endif<cr>
" }}}

" {{{ Tabbing
" tab navigation like firefox
nmap <Home> :tabprevious<cr>
map <Home> :tabprevious<cr>
imap <Home> <ESC>:tabprevious<cr>i
nmap <End> :tabnext<cr>
map <End> :tabnext<cr>
imap <End> <ESC>:tabnext<cr>i
nmap <C-t> :tabnew<cr>
imap <C-t> <ESC>:tabnew<cr> 

" Map <leader>e to open files in the same directory as the current file
map <leader>e :tabnew <C-R>=expand("%:h")<cr><cr>
" }}}
