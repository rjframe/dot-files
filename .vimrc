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

if filereadable('$HOME/.remoteprofile')
    let g:isremoteprofile = 1
else
    let g:isremoteprofile = 0
endif
" == End - modify the environment for vim. ==

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'itchyny/lightline.vim'
Plugin 'junegunn/vim-peekaboo'
Plugin 'mbbill/undotree'
" Plugin 'majutsushi/tagbar'

Plugin 'ntpeters/vim-better-whitespace'

if ! g:isremoteprofile
    Plugin 'tpope/vim-fugitive'
    Plugin 'junegunn/gv.vim'
    Plugin 'ludovicchabant/vim-gutentags'
    "Plugin 'vim-syntastic/syntastic'

    " Plugin 'previm/previm'
    Plugin 'vimwiki/vimwiki'

    Plugin 'martin-svk/vim-yaml'
    Plugin 'pearofducks/ansible-vim'
    Plugin 'bigeagle/sieve.vim'
    " Plugin 'jakwings/vim-pony'
    " Plugin 'elixir-editors/vim-elixir'
    " Plugin 'michaeljsmith/vim-indent-object'

    Plugin 'mattn/calendar-vim'
endif

if g:env != 'WINDOWS'
    Plugin 'tpope/vim-eunuch'
endif

" Plugin 'justinmk/vim-dirvish
" Plugin 'AndrewRadev/splitjoin.vim'

Plugin 'tmux-plugins/vim-tmux'

Plugin 'luochen1990/rainbow'
let g:rainbow_active = 1

call vundle#end()

filetype plugin indent on
syntax on

let mapleader=' '

" I default to UNIX line endings, even on Windows. Vim handles them just fine,
" and I don't care about other editors.
set fileformat=unix
set fileformats=unix,dos
set encoding=utf-8
set fileencoding=utf-8

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

" Set guide columns.
set colorcolumn=81,121
set noshowmode
set laststatus=2
set scrolloff=5
set showmatch

set modelines=0

set numberwidth=4
set columns=87
set number

" Keep the cursor's column position.
set nostartofline

" Mappings

" Window Management. The auto-size code is in plugin/gui.vim
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

nnoremap <F2> :UndotreeToggle<CR>

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
