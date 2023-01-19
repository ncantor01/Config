set expandtab
set mouse=a
set number

tnoremap <Esc> <C-\><C-n>

" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

" Turn syntax highlighting on.
syntax on

" Highlight cursor line underneath the cursor horizontally.
set cursorline

" Do not let cursor scroll below or above N number of lines when scrolling.
 set scrolloff=10

 " Set the commands to save in history default number is 20.
 set history=1000

 " Use highlighting when doing a search.
 set hlsearch
 
" Show partial command you type in the last line of the screen.
 set showcmd

  set nocompatible
  filetype off
  set encoding=utf-8

  set updatetime=300
  set signcolumn=yes

  call plug#begin('~/.vim/plugged')
    Plug 'sainnhe/everforest'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'ryanoasis/vim-devicons'
    Plug 'junegunn/goyo.vim'
    Plug 'junegunn/limelight.vim'
    Plug 'junegunn/seoul256.vim'
    Plug 'junegunn/vim-journal'
    Plug 'junegunn/rainbow_parentheses.vim'
    Plug 'zaki/zazen'
     Plug 'https://github.com/altercation/vim-colors-solarized'
     Plug 'yuttie/hydrangea-vim'
     Plug 'chriskempson/tomorrow-theme', { 'rtp': 'vim' }
     Plug 'rhysd/vim-color-spring-night'
     Plug 'https://github.com/morhetz/gruvbox'
     Plug 'https://github.com/rafi/awesome-vim-colorschemes'
     " Functionalities
     Plug 'https://github.com/xavierd/clang_complete'
     Plug 'https://github.com/edwinb/idris2-vim'
     Plug 'tpope/vim-fugitive'
     Plug 'tpope/vim-sensible'
     Plug 'tpope/vim-surround'
     Plug 'majutsushi/tagbar'
     Plug 'scrooloose/nerdtree'
     Plug 'scrooloose/nerdcommenter'
     Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
     Plug 'deoplete-plugins/deoplete-jedi'
     Plug 'ervandew/supertab'
     Plug 'jiangmiao/auto-pairs'
     Plug 'junegunn/vim-easy-align'
     Plug 'alvan/vim-closetag'
     Plug 'tpope/vim-abolish'
     Plug 'Yggdroot/indentLine'
     Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
     Plug 'junegunn/fzf.vim'
     Plug 'sheerun/vim-polyglot'
     Plug 'chrisbra/Colorizer'
     Plug 'KabbAmine/vCoolor.vim'
     Plug 'heavenshell/vim-pydocstring', { 'do': 'make install' }
     Plug 'vim-scripts/loremipsum'
     Plug 'honza/vim-snippets'
     Plug 'metakirby5/codi.vim'
     Plug 'dkarter/bullets.vim'
     Plug 'https://github.com/edwinb/idris2-vim'
     Plug 'neovimhaskell/haskell-vim'
     Plug 'https://github.com/fatih/vim-go'
     Plug 'kien/ctrlp.vim'
     Plug 'https://github.com/pulkomandy/c.vim'
     "rust
     Plug 'prabirshrestha/vim-lsp'
     Plug 'rust-lang/rust.vim'
     Plug 'neoclide/coc.nvim', {'branch': 'release'}
     Plug 'dense-analysis/ale'
     "sml
     Plug 'myegorov/schmerlin'
     call plug#end()

  set background=dark
  colorscheme seoul256

  set guicursor=n-v-c:block-Cursor
  set guicursor+=i:ver100-iCursor
  set guicursor+=n-v-c:blinkon0
  set guicursor+=i:blinkwait10

  "nerdtree
  nnoremap <leader>n :NERDTreeFocus<CR> 
  nnoremap <C-n> :NERDTree<CR> 
  nnoremap <C-t> :NERDTreeToggle<CR> 
  nnoremap <C-f> :NERDTreeFind<CR>

  "rust-analyzer
  if executable('rust-analyzer')
  au User lsp_setup call lsp#register_server({
        \   'name': 'Rust Language Server',
        \   'cmd': {server_info->['rust-analyzer']},
        \   'whitelist': ['rust'],
        \ })
  endif

  "rust config
  let g:rustfmt_autosave = 1
  let g:rustfmt_emit_files = 1
  let g:rustfmt_fail_silently = 0

  inoremap <silent><expr> <TAB>
        \ coc#pum#visible() ? "\<C-n>"
        \ CheckBackspace() ? "\<TAB>" :
        \ coc#refresh()

  inoremap <expr><S-TAB> coc#pum#visible() ? "\<C-p>" : "\<C-h>"
  
  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
  else
    inoremap <silent><expr> <c-@> coc#refresh()
  endif

  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)

  "sml
  autocmd BufNewFile,BufRead *.sml set filetype=sml
  "misc
  set nowrap

  

