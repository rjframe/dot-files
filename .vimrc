" == Begin - modify the environment for vim. ==

" From romainl: https://gist.github.com/romainl/4df4cde3498fada91032858d7af213c2
if !exists('g:env')
    if has('win64') || has('win32') || has('win16')
        let g:env = 'WINDOWS'
    else
        let g:env = toupper(substitute(system('uname'), '\n', '', ''))
    endif
endif

if g:env == 'WINDOWS'
    " Use .vim/ instead of vimfiles/
    let &runtimepath="$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after"
endif

let g:isremoteprofile = filereadable(expand('$HOME/.remoteprofile'))
" == End - modify the environment for vim. ==

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'itchyny/lightline.vim'
Plugin 'junegunn/vim-peekaboo'
Plugin 'mbbill/undotree'

Plugin 'ntpeters/vim-better-whitespace'

if ! g:isremoteprofile
    Plugin 'tpope/vim-endwise'
    Plugin 'tpope/vim-fugitive'
    Plugin 'junegunn/gv.vim'
    Plugin 'romainl/vim-cool'

    Plugin 'ludovicchabant/vim-gutentags'
    Plugin 'majutsushi/tagbar'

    Plugin 'camspiers/lens.vim'
    Plugin 'ctrlpvim/ctrlp.vim'
    " Plugin 'michaeljsmith/vim-indent-object'

    Plugin 'dense-analysis/ale'
    Plugin 'maximbaz/lightline-ale'

    Plugin 'pearofducks/ansible-vim'
    Plugin 'moll/vim-node'
    Plugin 'Vimjas/vim-python-pep8-indent'
    Plugin 'rust-lang/rust.vim'
    Plugin 'gpanders/vim-scdoc'
    Plugin 'bigeagle/sieve.vim'
    Plugin 'martin-svk/vim-yaml'

    Plugin 'CrispyDrone/vim-tasks', { 'pinned': 1 }
endif

if g:env != 'WINDOWS'
    Plugin 'tpope/vim-eunuch'
endif

Plugin 'luochen1990/rainbow'
let g:rainbow_active = 1

call vundle#end()


filetype plugin indent on
syntax on

let mapleader=' '
let maplocalleader=' '


set textwidth=80

" I default to UNIX line endings, even on Windows. Vim handles them just fine,
" and I don't care about other editors.
set fileformat=unix
set fileformats=unix,dos
set encoding=utf-8
set fileencoding=utf-8

set textwidth=80

set autoread
set autowrite

set backspace=indent,eol,start
set expandtab
set smarttab
set smartindent
set shiftwidth=4
set tabstop=4
"set cpoptions+=n
set clipboard^=unnamed,unnamedplus
set switchbuf=useopen,vsplit " Experiment.

set list
set listchars=tab:⍿·,trail:×

set noswapfile
set history=1000

if has('persistent_undo')
    set undodir="~/.vim/undo"
    set undolevels=500
    set undofile
endif

" Search settings
set ignorecase
set smartcase
set incsearch
set hlsearch
set cursorline
set wildignore+=*/.git/*,*/tmp/*,*.swp,*.a,*.exe,*.lib

" Set guide columns.
set colorcolumn=81
set noshowmode
set laststatus=2
set scrolloff=5
set showmatch

set modelines=1

set numberwidth=4
set columns=87
set number

set lazyredraw

" Keep the cursor's column position.
set nostartofline

" Close the quickfix and local list when all file buffers are closed.
augroup CloseLoclistWindowGroup
    autocmd!
    autocmd QuitPre * if empty(&buftype) | cclose | lclose | endif
augroup END

" Unmappings

nnoremap <Del> <Nop>

" Mappings

nnoremap s :syntax sync fromstart<CR>

nnoremap Q @@

" Window Management.
set splitright
nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l

nnoremap <Leader>v :vsplit $MYVIMRC<CR>

" Treat wrapped lines as unwrapped.
nnoremap j gj
nnoremap k gk

" Capitalize the word under the cursor.
nnoremap <Leader>u viwUe
" This would start vim in replace mode when opening a file from the terminal.
" TODO: Why?
"nnoremap <ESC> :nohlsearch<CR>

" View git commit info for the line under the cursor.
" From https://www.reddit.com/r/vim/comments/i50pce/
"       how_to_show_commit_that_introduced_current_line/
map <silent><Leader>g :call setbufvar(winbufnr(popup_atcursor(systemlist(
    \ "cd " . shellescape(fnamemodify(resolve(expand('%:p')), ":h")) . " &&
    \ git log --no-merges -n 1 -L " . shellescape(line("v") . "," . line(".") .
    \ ":" . resolve(expand("%:p")))), { "highlight": "StatusLine",
    \ "padding": [1,1,1,1], "pos": "botleft", "wrap": 0 })), "&filetype",
    \ "git")<CR>

nnoremap <F2> :UndotreeToggle<CR>
nnoremap <F8> :TagbarToggle<CR>

""" Note taking:

" TODO: May need revised to work on Windows.
" Also see .vim/before/tags.vim for ctags setup.
" Largely from https://www.edwinwenink.xyz/posts/42-vim_notetaking/
" TODO: I want easy recursive and non-recursive searches.

" Open index page
nnoremap <Leader>ni :e $HOME/notes/index.md<CR>
" Create new note
nnoremap <Leader>nn
    \ :execute ":e $HOME/notes/" . strftime("%Y%m%d%H%M%S") . ".md"<CR>
nnoremap <Leader>t :CtrlPTag<CR>
nnoremap <Leader>ns :NotesGrep

let g_ctrlp_user_caching = 0

if executable('rg')
    let g:ctrlp_user_command = 'rg %s --files --color=never --glob "*"'
else
    let g:ctrlp_user_command = 'grep -r %s'
endif

if executable('rga')
    set grepprg=rga\ --vimgrep

    command! -nargs=1 NotesGrep execute 'silent grep! -S "<args>" "$HOME/notes/"'
        \ | redraw! | botright vertical cwindow | vertical resize 45
else
    command! -nargs=1 NotesGrep
        \ execute 'silent grep! -r -i --include="*.md" "<args>" "$HOME/notes/"'
        \ | redraw! | botright vertical cwindow | vertical resize 45
endif

""" END Note taking

nnoremap <Leader>h :ALEHover<CR>

xnoremap <silent> in :<C-U>call SelectInNumber()<CR>
onoremap <silent> in :<C-U>call SelectInNumber()<CR>

" Sort comma-separated elements. From https://stackoverflow.com/a/45956320
xnoremap <Leader>ss s<C-R>=join(sort(split(@", '\s*,\s*')), ', ')<CR><ESC>
" The same, with no spaces inserted.
xnoremap <Leader>sns s<C-R>=join(sort(split(@", '\s*,\s*')), ',')<CR><ESC>

" Remove duplicates
xnoremap  <Leader>q :call Uniq()<CR>
xnoremap  <Leader>Q :call Uniq('ignore whitespace')<CR>

" Run a "before" folder prior to loading plugins.
runtime! before/*.vim
