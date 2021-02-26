setlocal define=^\\s*\(alias\|enum\)

" Read D module import filenames.
setlocal include=^\\simport
setlocal includeexpr=substitute(v:fname,'\\.','/','g')
setlocal suffixesadd=.d

if g:env == 'WINDOWS'
    setlocal path+=c:\d\dmd2\src\phobos,c:\d\dmd2\src\druntime\src,
else
    if !exists($dmd_path) && executable('asdf')
        let dmd_base = substitute(system('asdf where dmd'), '\n', '', 'g')
            \ .. '/dmd2/src/'

        let $dmd_path = dmd_base .. 'phobos,' .. dmd_base .. 'druntime/src,'
        setlocal path+=$dmd_path
    else
        " dmd installed via system. This is the Archlinux path.
        setlocal path+=/usr/include/dlang/dmd,
    endif
endif

" Comment/uncomment the current line.
nnoremap <Leader>c I// <ESC>
nnoremap <Leader>uc ^3x<ESC>
