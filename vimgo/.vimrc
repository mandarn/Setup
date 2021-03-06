" Scrolls the screen from the middle of the screen
"set scrolloff=999

" Highlights the search results
set hlsearch
hi Search cterm=NONE ctermfg=grey ctermbg=LightGreen

" Ignores case searching but if capital letters used in search, i
" uses case sensitive search
set ignorecase
set smartcase

" Set syntax for c code
syntax on

" Incremental search
set incsearch

" Indents the text in the file while writing
set autoindent

" Indentation specific to C language
set cindent

" Use spaces insted of a tab
"set expandtab

set tabstop=4
set softtabstop=4
set shiftwidth=4

" Highlights the line of the current cursor position.
set cursorline
hi CursorLine gui=underline

" Shows line numbers.
set nu

" Enable colors and utf-8
set encoding=utf-8
set t_Co=256

" Enabled spell checks with underlineing and making it bold.
" hi SpellBad cterm=underline ctermfg=red --> This will make color red
set spell
hi clear SpellBad
hi SpellBad cterm=underline,bold

" Highlight the letters after column 80.
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"highlight OverLength ctermfg=red
"match OverLength /\%81v.\+/

" This sets the cursor to the last edit position in the file.
augroup vimrcEx
  au!
  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal g`\"" |
     \ endif
augroup END

" Load the csope databse file from the current directory.
" Added cscope_maps.vim plugin in ~/.vim/plugin which does this by default.
"cs add cscope.out

" This option makes sure that cscope is not loaded twice.
" Above happens only if vim is pre-compiled with cscope and cscope plugin tries to reload database and fails
set nocscopeverbose

" air-line
"let g:airline_powerline_fonts = 1
let g:Powerline_symbols = 'fancy'

set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

if !exists('g:airline_symbols')
	    let g:airline_symbols = {}
	endif

let g:airline_theme             = 'powerlineish'
let g:airline_enable_branch     = 1
let g:airline_enable_syntastic  = 1

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

set guifont=DejaVu\ Sans:s12

