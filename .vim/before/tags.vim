" Run this before plugins are loaded.

if !executable('ctags')
    let g:gutentags_dont_load = 1
    finish
endif

let g:gutentags_cache_dir = '~/.vim/tags'
