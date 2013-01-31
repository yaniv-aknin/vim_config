" trim trailing whitespace
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``

" hide dotfiles and *.pyc in netrw
set wildignore=*.o,*~,*.pyc,*.swp
let g:netrw_list_hide='^\.[^\.],\.pyc$'

" ask syntastic to only highlight errors, no signs
let syntastic_enable_signs=0
