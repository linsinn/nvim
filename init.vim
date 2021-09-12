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

call plug#end()

" ============================
" settings
" ============================
filetype on
filetype plugin indent on
syntax on

set number
set relativenumber
set clipboard+=unnamedplus
set ignorecase
set smartcase


" ============================
" Color
" ============================
colorscheme PaperColor


" ============================
" key mapping
" ============================
nmap ; :
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
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
