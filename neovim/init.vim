" Minimalist Neovim configuration for C++ development

" Set the leader key to comma
let mapleader = ","

" Enable line numbers
set number
set ts=2
set sw=2
set smarttab

" Enable syntax highlighting
syntax enable

" Install and manage plugins using vim-plug
call plug#begin('~/.config/nvim/plugged')

" Nodejs extension host for vim and neovim to load extensions
" like vscode and host language servers.
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Completion engine for neovim coded in lua
Plug 'hrsh7th/nvim-cmp'

" Tabnine client for neovim
Plug 'codota/tabnine-nvim', { 'do': './dl_binaries.sh' }

" LSP client for neovim
Plug 'neovim/nvim-lspconfig'

" Auto completion framework. nvim-cmp should have been sufficient but
" it needs to be configured well.
Plug 'nvim-lua/completion-nvim'

" Add other plugins as needed
call plug#end()

" Keybindings
" Example: Map F5 to build and run current C++ file
nnoremap <F5> :!g++ % -o %< && ./%<<CR>

" Configure Coc.nvim (for code completion, linting, etc.)
let g:coc_global_extensions = ['coc-clangd']

" Set the colorscheme (optional)
colorscheme desert

" Your other custom settings go here

" Below settings are for completion-nvim
"" Use <Tab> and <S-Tab> to navigate through popup menu
"inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"
"" Set completeopt to have a better completion experience
"set completeopt=menuone,noinsert,noselect
"
"" Avoid showing message extra message when using completion
"set shortmess+=c

inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"
:set completeopt-=preview
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>

" Save and quit
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

lua <<EOF
require('tabnine').setup({
  disable_auto_comment=true,
  accept_keymap="<Tab>",
  dismiss_keymap = "<C-]>",
  debounce_ms = 800,
  suggestion_color = {gui = "#808080", cterm = 244},
  exclude_filetypes = {"TelescopePrompt", "NvimTree"},
  log_file_path = nil, -- absolute path to Tabnine log file
})
EOF
