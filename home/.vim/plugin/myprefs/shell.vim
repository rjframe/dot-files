" Can't get vundle to work with this, even after fixing the source.
" Something to do with PS cwd?
"if g:env =~ 'WINDOWS'
"    if executable("PowerShell")
"        set shell=PowerShell
"        set shellcmdflag="-ExecutionPolicy RemoteSigned -Command"
"        set shellquote=\"
"        set shellxquote=" "
"    endif
"endif

if g:env =~ 'WINDOWS'
    if executable('bash')
        set shell=bash
    endif
endif
