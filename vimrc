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
" wildmenu shows possible command completion when hitting <tab>
set wildmenu
" ruler adds current cursor location in the status line
set ruler
" }}}

" {{{ General bindings
" hitting F1 by mistake is annoying; replace with ESC
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
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

" {{{ Search
" always use perl style regex for searching
nnoremap \ /\v
vnoremap \ /\v
" ignore case when search is lowercase, sensitise upon first uppercase char
set ignorecase
set smartcase
" replacement are global unless suffixed by /g (opposite of default)
set gdefault
" incremental search, show matches, highlight search, dehighlight upon ,<space>
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :nohlsearch<cr>
map <leader>u /[^ -~\s\t]<CR>
" }}}

" {{{ Grow up already
function NoArrows ()
    nnoremap <up> <nop>
    nnoremap <down> <nop>
    nnoremap <left> <nop>
    nnoremap <right> <nop>
    inoremap <up> <nop>
    inoremap <down> <nop>
    inoremap <left> <nop>
    inoremap <right> <nop>
endfunction

nmap <leader>A :call NoArrows()<CR>
" }}}

" support a site-local config file
let local_config_file=$HOME."/.local.vim"
if filereadable(local_config_file)
    exec "source" local_config_file
endif

" source non-pathogen addons FIXME: learn vim syntax and avoid kludges...
let python_location=$HOME."/.vim/nonpathogen/python_location.vim"
exec "source" python_location

" make it easy to toggle paste mode
set pastetoggle=<F2>
