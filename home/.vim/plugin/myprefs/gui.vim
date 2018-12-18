if !has("gui_running")
	set t_Co=256
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
