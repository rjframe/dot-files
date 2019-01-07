
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

" Add common attributes.
inoreabbrev sp @safe pure
inoreabbrev gsp @nogc @safe pure

inoreabbrev un{ unittest {<CR><CR>}<Up><Tab>
