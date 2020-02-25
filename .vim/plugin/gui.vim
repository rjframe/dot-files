if !has("gui_running")
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

" Horizontal code resize comes from https://stackoverflow.com/a/8024859/1991068
let s:auto_resize_width = &numberwidth + 83
let s:auto_resize_height = &lines -2
let s:vimpos_xy = getwinpos()

function! s:AutoResize()
    let win_width = winwidth(winnr())
    if win_width < s:auto_resize_width
        let &columns += s:auto_resize_width
    elseif win_width > s:auto_resize_width
        let &columns = s:auto_resize_width
    endif
    let win_height = winheight(winnr())
    if win_height < s:auto_resize_height
        let &lines += s:auto_resize_height - 2
    elseif win_height > s:auto_resize_height
        let &lines = s:auto_resize_height + 2
    endif
    wincmd =

    " Restore position after all splits close.
    if winnr('$') == 1
        execute "winpos" s:vimpos_xy[0] s:vimpos_xy[1]
    endif
endfunction

augroup AutoResize
    autocmd!
    " On the first split, grab the current window position.
    autocmd WinNew * if winnr('$') == 2 | let s:vimpos_xy = getwinpos() | endif

    autocmd WinEnter * call <sid>AutoResize()
augroup END

