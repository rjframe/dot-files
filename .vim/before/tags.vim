" Run this before plugins are loaded.

if !executable('ctags')
    let g:gutentags_dont_load = 1
    finish
endif

" Debugging.
let g:gutentags_define_advanced_commands = 1

let g:gutentags_cache_dir = expand('~/.cache/vim/tags')
let g:gutentags_add_default_project_roots = 0
let g:gutentags_project_root = ['.git', '.hg', 'dub.sdl', 'dub.json', 'index.md']
let g:gutentags_add_ctrlp_root_markers = 0

let g:gutentags_ctags_exclude = [
    \ '*/build/*', '*/bin/*', '*/cache/*',
    \ '*.json', '*.sdl',
    \ 'tags*'
\]

" The mdtags options are for a note-taking test. Treats '@something' as a tag.
let g:gutentags_ctags_extra_args = [
    \ '--fields=+ailmnrS',
    \ '--extras=+q',
    \ '--langdef=mdtags',
    \ '--langmap=mdtags:.md',
    \ '--mline-regex-mdtags=/(^|[[:space:]])@(\w\S*)/\2/t/{mgroup=1}'
\]
