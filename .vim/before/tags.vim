" Run this before plugins are loaded.

" This is the default, but vim is complaining now if it's not defined.
let g:tagbar_use_cache = 1

if !executable('ctags')
    let g:gutentags_dont_load = 1
    finish
endif

" Useful for debugging.
let g:gutentags_define_advanced_commands = 0

let g:gutentags_cache_dir = expand('~/.cache/vim/tags')
let g:gutentags_add_default_project_roots = 0

let g:gutentags_project_root = [
    \ '.git', '.hg',
    \ 'Cargo.toml',
    \ 'dub.sdl', 'dub.json',
    \ 'Makefile',
    \ 'index.md'
\]

let g:gutentags_add_ctrlp_root_markers = 0

let g:gutentags_ctags_exclude = [
    \ '*/build/*', '*/bin/*', '*/cache/*',
    \ '*.htm', '*.html', '*.xml',
    \ '*.json', '*.sdl',
    \ 'tags*'
\]

" The mdtags options are for note-taking. Treats '@something' as a tag.
let g:gutentags_ctags_extra_args = [
    \ '--fields=+ailmnrS',
    \ '--extras=+q',
    \ '--regex-d=/^\s*\w+!\w+\s+(\w+)\(/\1/f/',
    \ '--langdef=mdtags',
    \ '--langmap=mdtags:.md',
    \ '--mline-regex-mdtags=/(^|[[:space:]])@(\w\S*)/\2/t/{mgroup=1}'
\]
