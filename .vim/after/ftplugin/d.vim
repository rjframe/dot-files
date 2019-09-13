
setlocal define=^\\s*alias

" Read D module import filenames.
setlocal include=import
setlocal includeexpr=substitute(v:fname,'\\.','/','g')
setlocal suffixesadd=.d

" TODO: cross-platform path.
setlocal path+=c:\d\dmd2\src\phobos,c:\d\dmd2\src\druntime\src,

" Comment/uncomment the current line.
nnoremap <Leader>c I// <ESC>
nnoremap <Leader>uc ^3x<ESC>

" == Snippets ==
" TODO: If I use many, start using a snippet manager instead.

" Add common attributes.
inoreabbrev sp @safe pure
inoreabbrev gsp @nogc @safe pure

" use: ut<Tab>
inoreabbrev ut unittest {<CR><CR>}<Up>
" use: utt"
inoreabbrev utt @(")<CR>unittest {<CR><CR>}<Up><Up><Up><Right>
