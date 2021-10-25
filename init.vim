let mapleader = "\<Space>"

set nocompatible
filetype off

" =============================================================================
"  # PLUGINS
" =============================================================================
call plug#begin()
" Load plugins
" VIM enhancements
Plug 'ciaranm/securemodelines'
Plug 'editorconfig/editorconfig-vim'
Plug 'justinmk/vim-sneak'

" GUI enhancements
Plug 'itchyny/lightline.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'andymass/vim-matchup'
Plug 'rafi/awesome-vim-colorschemes'

" Fuzzy finder
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Semantic language support
Plug 'neoclide/coc.nvim', {'branch': 'release'}


" Syntactic language support
Plug 'cespare/vim-toml'
Plug 'stephpy/vim-yaml'
Plug 'rust-lang/rust.vim'
Plug 'rhysd/vim-clang-format'
"Plug 'fatih/vim-go'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'tpope/vim-commentary'
Plug 'preservim/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'sheerun/vim-polyglot'

" snippets
Plug 'honza/vim-snippets'

call plug#end()

" ============================
" settings
" ============================
filetype on
filetype plugin indent on
syntax on

set number
set relativenumber
set ignorecase
set smartcase


" ============================
" fonts and color
" ============================
let g:PaperColor_Theme_Options = {
	\   'theme': {
	\     'default': {
	\       'transparent_background' : 1
  \     },
	\     'default.dark': {
	\       'transparent_background' : 1
  \     }
  \   }
  \ }
highlight comment cterm=italic
colorscheme gruvbox
set background=dark


" ============================
" key mapping
" ============================
map ; :
nmap H ^
nmap L $

imap jj <Esc>

nmap <silent> <leader>w :w<Cr>
nmap <silent> <leader>q :q<Cr>

nmap <silent> <C-n> :nohlsearch<Cr>

nmap <F8> :NERDTreeToggle<Cr>


" ============================
" Rust
" ============================
let g:rustfmt_autosave = 1



" ============================
" Workspace
" ============================
let b:coc_root_patterns = ['.git', '.vim-workspace']
let g:rooter_patterns = ['.git', '.vim-workspace']



" ============================
" coc
" ============================
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)zz
nmap <silent> ]g <Plug>(coc-diagnostic-next)zz

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)

" coc-snippets
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)
" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)
" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-n> <Plug>(coc-snippets-expand-jump)
" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

" Make <tab> used for trigger completion, completion confirm, snippet expand and jump like VSCode.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <s-tab> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<S-tab>'
" Use <tab> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<tab>'


" ============================
" copy and paste
" ============================
nmap Y y$
set clipboard+=unnamedplus
let g:clipboard = {
	\   'name': 'win32yank-wsl',
	\   'copy': {
	\      '+': 'win32yank.exe -i --crlf',
	\      '*': 'win32yank.exe -i --crlf',
	\    },
	\   'paste': {
	\      '+': 'win32yank.exe -o --lf',
	\      '*': 'win32yank.exe -o --lf',
	\   },
	\   'cache_enabled': 0,
	\ }


" ============================
" fzf
" ============================
nmap <silent> <leader>ff :Files<Cr>
nmap <silent> <leader>fs :Rg<Cr>
nmap <silent> <leader>ft :Tags<Cr>
nmap <silent> <leader>fb :Buffers<Cr>
nmap <silent> <leader>fr :History<Cr>
nmap <silent> <leader>fh :History:<Cr>


" ============================
" permanent undo
" ============================
set undodir=~/.config/nvim/undodir
set undofile
