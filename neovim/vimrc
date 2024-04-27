" ================ General Config ====================
"My preferences
map <S-PageUp> :set co=140<CR>:set lines=50<CR>
map <C-S> :w<CR>
map <C-Q> :q<CR>
map <C-b> :cs find g
set scrolloff=4

set is
set sw=2
set ts=4
set expandtab
set hlsearch
set incsearch
"set ignorecase smartcase

set smarttab
set autoindent
set smartindent
set cindent
set gfn=Courier\ 10\ Pitch\ 13
set nocompatible
filetype on

syntax enable
syntax on

"Key Mappings for cscope
:map <C-F> :cs find f
nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR> 
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR> 
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>     
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR> 
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

"Key Mappings for quickfix
set cscopequickfix=s-,c-,d-,i-,t-,f-,e-
:map <C-Right> :cn<CR>
:map <C-Left>  :cp<CR>
:map <C-Down>  :cope 15<CR>

"Key Mappings for C-Ref Manual
:map <F2> \cr
:map <F3> \cw

"Key Mapping for Tag Explorer
nnoremap <silent> <F7> :TagExplorer<CR>

"Key Mappings for BufExplorer
let bufExplorerOpenMode=1
let bufExplorerSplitBelow=1
let bufExplorerSplitHorzSize=10
:map <S-Right> :bnext<CR>
:map <S-Left>  :bprev<CR>
:map <S-Down>  \bs

"Scrolling in Insert mode
:inoremap <C-E> <C-X><C-E>
:inoremap <C-Y> <C-X><C-Y>

:map <F5> :set ic<CR>
:map <F6> :set noic<CR>

:map <F7> :syntax on<CR>
:map <F8> :syntax off<CR>

:map <F9>  :cp<CR>
:map <F10> :cn<CR>
:map <F11> :cope 15<CR>

:set guifont=Monospace\ 12

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

"turn on syntax highlighting
syntax on

" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
" The mapleader has to be set before vundle starts loading all 
" the plugins.
let mapleader=","

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set expandtab

filetype plugin on
filetype indent on

set wrap       "Wrap lines
set linebreak    "Wrap lines at convenient points

filetype plugin indent on     " required!
" Color theme (drawing from altercation/vim-colors-solarized Bundle)
syntax enable

" For MacVim
set guifont=Monaco:h16
