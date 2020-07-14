" The rust.vim plugin adds <:> to matchpairs. I don't want it.
"set matchpairs=(:),{:},[:]
set matchpairs-=<:>

" Autocomplete
inoremap <C-c> <C-x><C-o>

nmap <buffer> gd         <Plug>(rust-def)
nmap <buffer> gs         <Plug>(rust-def-split)
nmap <buffer> gx         <Plug>(rust-def-vertical)
nmap <buffer> gt         <Plug>(rust-def-tab)
nmap <buffer> <leader>gd <Plug>(rust-doc)

" The rust.vim plugin resets this.
set textwidth=80
