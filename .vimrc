" Disable default plugins I'll never use.
let g:loaded_getscriptPlugin = 1
let g:loaded_rrhelper = 1

" In the plugins folder, this doesn't run in time.
if !executable('ctags')
    let g:gutentags_dont_load = 1
endif

" From romainl - https://gist.github.com/romainl/4df4cde3498fada91032858d7af213c2
if !exists('g:env')
	if has('win64') || has('win32') || has('win16')
		let g:env = 'WINDOWS'
	else
		let g:env = toupper(substitute(system('uname'), '\n', '', ''))
	endif
endif

if g:env =~ 'WINDOWS'
    let &runtimepath="$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after"
endif

" Vundle configuration.
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'itchyny/lightline.vim'
Plugin 'junegunn/vim-peekaboo'
Plugin 'mbbill/undotree'
" Plugin 'majutsushi/tagbar'

Plugin 'ntpeters/vim-better-whitespace'
Plugin 'tpope/vim-fugitive'
Plugin 'junegunn/gv.vim'

Plugin 'ludovicchabant/vim-gutentags'
Plugin 'tpope/vim-eunuch'
" Plugin 'justinmk/vim-dirvish
" Plugin 'AndrewRadev/splitjoin.vim'

Plugin 'previm/previm'
Plugin 'vimwiki/vimwiki'

Plugin 'mattn/calendar-vim'

Plugin 'martin-svk/vim-yaml'
Plugin 'pearofducks/ansible-vim'

call vundle#end()

filetype plugin indent on
syntax on

" Convenient leader.
let mapleader=' '

" I default to UNIX line endings, even on Windows. Vim handles them just fine.
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
set cpoptions+=n

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

" Set guide columns.
set cc=81,121

set laststatus=2
set scrolloff=5
set showmatch

set modelines=0

set nu
" I want to see 82 characters, regardless of the size of the gutter; this gives
" me a 3-char margin on the right, which looks nice, and we won't wrap once the
" left gutter expands by one.
" From http://superuser.com/a/330352
au BufRead * let &numberwidth = float2nr(log10(line("$"))) + 4
	\| let &columns = &numberwidth + 83

set nostartofline " Keep the cursor's column position.

" = Mappings =

" Treat wrapped lines as unwrapped.
nnoremap j gj
nnoremap k gk

" Capitalize the word under the cursor.
nnoremap <Leader>U viwU
inoremap jj <ESC>

nnoremap <F2> :UndotreeToggle<cr>

xnoremap <silent> in :<c-u>call SelectInNumber()<cr>
onoremap <silent> in :<c-u>call SelectInNumber()<cr>

" Sort comma-separated elements. From https://stackoverflow.com/a/45956320
xnoremap <leader>ss s<c-r>=join(sort(split(@", '\s*,\s*')), ', ')<cr><esc>
" The same, with no spaces inserted.
xnoremap <leader>sns s<c-r>=join(sort(split(@", '\s*,\s*')), ',')<cr><esc>

" Run a "before" folder prior to loading plugins.
runtime! before/*.vim
