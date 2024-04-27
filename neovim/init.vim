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

" Install tabnine binaries directly using neovim 
Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }

" Tabnine client for neovim
Plug 'codota/tabnine-nvim', { 'do': './dl_binaries.sh' }

" Telescope plugin
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.6' }
Plug 'sharkdp/fd'
Plug 'BurntSushi/ripgrep'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/playground'
Plug 'nvim-telescope/telescope-fzf-native.nvim'

" Old school cscope nvaigation
Plug 'dhananjaylatkar/cscope_maps.nvim'


" Install	ctags like plugin
Plug 'ludovicchabant/vim-gutentags'

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

" Save and quit
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

inoremap <expr> <TAB> pumvisible() ? "<C-y>" : "<TAB>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

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
