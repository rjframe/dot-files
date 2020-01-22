" Run this before plugins are loaded.

if !executable('ctags')
    let g:gutentags_dont_load = 1
    finish
endif

" Debugging.
let g:gutentags_define_advanced_commands = 1

let g:gutentags_cache_dir = expand('~/.cache/vim/tags')
let g:gutentags_add_default_project_roots = 0
let g:gutentags_project_root = ['.git', '.hg', 'dub.sdl', 'dub.json']
let g:gutentags_add_ctrlp_root_markers = 0

let g:gutentags_ctags_exclude = [
    \ '*/build/*', '*/bin/*', '*/cache/*',
    \ '*.md', '*.json', '*.sdl',
    \ 'tags*'
\]

let g:gutentags_ctags_extra_args = [
    \ '--fields=+ailmnrS',
    \ '--extras=+q'
\]
