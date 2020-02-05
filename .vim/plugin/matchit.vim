" To install matchit docs:
" :!mkdir -p ~/.vim/docs
" :!cp $VIMRUNTIME/macros/matchit.txt ~/.vim/docs
" :helptags ~/.vim/docs

if !exists("g:loaded_matchit")
    runtime macros/matchit.vim
endif

" TODO: Add this for languages where useful; the showmatch beep on > is
" annoying.
"set matchpairs+=<:>
