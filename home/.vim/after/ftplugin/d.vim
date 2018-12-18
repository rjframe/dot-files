
setlocal define=^\\s*alias

" Read D module import filenames.
setlocal include=import
setlocal includeexpr=substitute(v:fname,'\\.','/','g')
setlocal suffixesadd=.d

" TODO: cross-platform path.
setlocal path+=c:\d\dmd2\src\phobos,c:\d\dmd2\src\druntime\src,

