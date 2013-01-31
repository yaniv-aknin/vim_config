" trim trailing whitespace
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``

" hide dotfiles and *.pyc in netrw
set wildignore=*.o,*~,*.pyc,*.swp
let g:netrw_list_hide='^\.[^\.],\.pyc$'

" ask syntastic to only highlight errors, no signs
let syntastic_enable_signs=0

" Add the virtualenv's site-packages to vim Python path
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

" add everything in Python path to vim's search paths (i.e., for ":h gf")
python << EOF
import os
import sys
import vim
for p in sys.path:
    # Add each directory in sys.path, if it exists.
    if os.path.isdir(p):
        # Command 'set' needs backslash before each space.
        vim.command(r"set path+=%s" % (p.replace(" ", r"\ ")))
EOF

" map ,g to go to file under cursor in new tab
map <leader>g <C-W>gf
