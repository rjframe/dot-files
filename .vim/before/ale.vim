" TODO: Use https://github.com/lacygoill/vim-virtual-text and get the location
" and text of :ALEHover; place it as virtual text.
"
let g:ale_completion_autoimport = 1
let g:ale_hover_cursor = 1
let g:ale_open_list = 1
let g:ale_set_quickfix = 1
let g:ale_set_highlights = 0
let g:ale_warn_about_trailing_blank_lines = 0
let g:ale_warn_about_trailing_whitespace = 0
let g:ale_history_enabled = 0

" Not working as I'd like: can't keep the window small.
let g:lens#disabled_buftypes = ["quickfix"]
"let g:ale_cursor_detail = 1
let g:ale_close_preview_on_insert = 1
"set splitbelow

let g:lightline = {}

let g:lightline.component_expand = {
    \ 'linter_checking': 'lightline#ale#checking',
    \ 'linter_infos': 'lightline#ale#infos',
    \ 'linter_warnings': 'lightline#ale#warnings',
    \ 'linter_errors': 'lightline#ale#errors',
    \ 'linter_ok': 'lightline#ale#ok',
\}

let g:lightline.component_type = {
    \ 'linter_checking': 'right',
    \ 'linter_infos': 'right',
    \ 'linter_warnings': 'warning',
    \ 'linter_errors': 'error',
    \ 'linter_ok': 'right',
\}

let g:lightline.active = {
    \ 'right': [
        \[
            \ 'linter_checking',
            \ 'linter_errors',
            \ 'linter_warnings',
            \ 'linter_infos',
            \ 'linter_ok'
        \],
        \[ 'lineinfo' ],
        \[ 'percent' ]
    \]
\}

let g:lightline#ale#indicator_checking = "\uf110"
let g:lightline#ale#indicator_infos = "\uf129"
let g:lightline#ale#indicator_warnings = "\uf071"
let g:lightline#ale#indicator_errors = "\uf05e"
let g:lightline#ale#indicator_ok = ""
