" from http://jeetworks.org/node/147

" There are a number of Vim plugins to show the current Python
"   class and method name or function name (e.g., this). However, they
"   can be extremely 'heavy' (the linked example requires Vim compiled
"   with Python, and is pretty slow when indexing a large Python file)
"   and moreover, all seem to be geared to showing the information
"   dynamically in the status bar. While the latter might be desirable in
"   some contexts, the required binding to a CursorHold trigger coupled
"   with the slowness in indexing, make it clumsy to use when navigating
"   large files. Sometimes, all that is wanted or needed is an 'on-demand'
"   brief display of the information. The following code takes care of
"   this. When sourced into your Vim session, it echos the current Python
"   class and method name or function name when invoked via '<Leader>?' or
"   ':EchoPythonLocation'.

function! s:get_last_python_class()
    let l:retval = ""
    let l:last_line_declaring_a_class = search('^\s*class', 'bnW')
    let l:last_line_starting_with_a_word_other_than_class = search('^\ \(\<\)\@=\(class\)\@!', 'bnW')
    if l:last_line_starting_with_a_word_other_than_class < l:last_line_declaring_a_class
        let l:nameline = getline(l:last_line_declaring_a_class)
        let l:classend = matchend(l:nameline, '\s*class\s\+')
        let l:classnameend = matchend(l:nameline, '\s*class\s\+[A-Za-z0-9_]\+')
        let l:retval = strpart(l:nameline, l:classend, l:classnameend-l:classend)
    endif
    return l:retval
endfunction

function! s:get_last_python_def()
    let l:retval = ""
    let l:last_line_declaring_a_def = search('^\s*def', 'bnW')
    let l:last_line_starting_with_a_word_other_than_def = search('^\ \(\<\)\@=\(def\)\@!', 'bnW')
    if l:last_line_starting_with_a_word_other_than_def < l:last_line_declaring_a_def
        let l:nameline = getline(l:last_line_declaring_a_def)
        let l:defend = matchend(l:nameline, '\s*def\s\+')
        let l:defnameend = matchend(l:nameline, '\s*def\s\+[A-Za-z0-9_]\+')
        let l:retval = strpart(l:nameline, l:defend, l:defnameend-l:defend)
    endif
    return l:retval
endfunction

function! s:compose_python_location()
    let l:pyloc = s:get_last_python_class()
    if !empty(pyloc)
        let pyloc = pyloc . "."
    endif
    let pyloc = pyloc . s:get_last_python_def()
    return pyloc
endfunction

function! <SID>EchoPythonLocation()
    echo s:compose_python_location()
endfunction

command! PythonLocation :call <SID>EchoPythonLocation()
nnoremap <Leader>, :PythonLocation<CR>
