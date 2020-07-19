if has("gui_running")
    colorscheme industry
else
    set t_Co=256

    " Use a block cursor on supporting terminals.
    let &t_ti.="\e[1 q"
    let &t_SI.="\e[5 q"
    let &t_EI.="\e[1 q"
    let &t_te.="\e[0 q"
    finish
endif

if has("gui_gtk2")
    set guifont=Inconsolata\ 12
elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
elseif has("gui_win32")
    set guifont=Fira\ Code:h11
    set renderoptions=type:directx
endif
