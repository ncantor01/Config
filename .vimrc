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

 " Enable auto completion menu after pressing TAB.
  set wildmenu
 
  " Make wildmenu behave like similar to Bash completion.
  set wildmode=list:longest
 
  " There are certain files that we would never want to edit with Vim.
  " Wildmenu will ignore files with these extensions.
  set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

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
    Plug 'nightsense/forgotten'
    Plug 'zaki/zazen'
    
    " Aethetics - Additional
     Plug 'nightsense/nemo'
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
     Plug 'SirVer/ultisnips'
     Plug 'honza/vim-snippets'
     Plug 'metakirby5/codi.vim'
     Plug 'dkarter/bullets.vim'
     Plug 'https://github.com/edwinb/idris2-vim'
     Plug 'neovimhaskell/haskell-vim'
     Plug 'https://github.com/fatih/vim-go'
     Plug 'vim-scripts/indentpython.vim'
     Plug 'kien/ctrlp.vim'
     Plug 'https://github.com/pulkomandy/c.vim'
  call plug#end()

  set background=dark
  colorscheme seoul256

  set guicursor=n-v-c:block-Cursor
  set guicursor+=i:ver100-iCursor
  set guicursor+=n-v-c:blinkon0
  set guicursor+=i:blinkwait10
