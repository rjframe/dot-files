" To install matchit docs:
" :!mkdir -p ~/.vim/docs
" :!cp $VIMRUNTIME/macros/matchit.txt ~/.vim/docs
" :helptags ~/.vim/docs

if !exists("g:loaded_matchit")
    runtime macros/matchit.vim
endif

set matchpairs+=<:>
