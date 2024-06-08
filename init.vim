set number
set expandtab

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
 set scrolloff=2

 " Set the commands to save in history default number is 20.
 set history=1000

 " Use highlighting when doing a search.
 set hlsearch
 
" Show partial command you type in the last line of the screen.
 set showcmd

  filetype off
  set encoding=utf-8

  set updatetime=300
  set signcolumn=yes


  call plug#begin()
    Plug 'sainnhe/everforest'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'ryanoasis/vim-devicons'
    Plug 'junegunn/goyo.vim'
    Plug 'junegunn/limelight.vim'
    Plug 'junegunn/seoul256.vim'
    Plug 'junegunn/vim-journal'
    Plug 'https://github.com/xavierd/clang_complete'
    Plug 'https://github.com/edwinb/idris2-vim'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-sensible'
    Plug 'tpope/vim-surround'
    Plug 'majutsushi/tagbar'
    Plug 'scrooloose/nerdtree'
    Plug 'scrooloose/nerdcommenter'
    Plug 'junegunn/rainbow_parentheses.vim'
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'deoplete-plugins/deoplete-jedi'
    Plug 'ervandew/supertab'
    Plug 'jiangmiao/auto-pairs'
    Plug 'junegunn/vim-easy-align'
    Plug 'alvan/vim-closetag'
    Plug 'tpope/vim-abolish'
    Plug 'Yggdroot/indentLine'
    Plug 'sheerun/vim-polyglot'
    Plug 'chrisbra/Colorizer'
    Plug 'KabbAmine/vCoolor.vim'
    Plug 'heavenshell/vim-pydocstring', { 'do': 'make install' }
    Plug 'vim-scripts/loremipsum'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.6' }
    Plug 'roxma/vim-hug-neovim-rpc'
    Plug 'roxma/nvim-yarp', { 'do': 'pip install -r requirements.txt'  }
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
  call plug#end()

  colorscheme everforest

  "cursor
  set guicursor=n-v-c:block-Cursor
  set guicursor+=i:ver100-iCursor
  set guicursor+=n-v-c:blinkon0
  set guicursor+=i:blinkwait10

  "nerdtree
  nnoremap <leader>n :NERDTreeFocus<CR> 
  nnoremap <C-n> :NERDTree<CR> 
  nnoremap <C-t> :NERDTreeToggle<CR> 
  nnoremap <C-f> :NERDTreeFind<CR>

" Find files using Telescope command-line sugar.
 nnoremap <leader>ff <cmd>Telescope find_files<cr>
 nnoremap <leader>fg <cmd>Telescope live_grep<cr>
 nnoremap <leader>fb <cmd>Telescope buffers<cr>
 nnoremap <leader>fh <cmd>Telescope help_tags<cr>

 "deplete
 let g:deoplete#enable_at_startup = 1

 " Start interactive EasyAlign in visual mode (e.g. vipga)
  xmap ga <Plug>(EasyAlign)
 " Start interactive EasyAlign for a motion/text object (e.g. gaip)
  nmap ga <Plug>(EasyAlign)coc

 " Use <c-space> to trigger completion.
 inoremap <silent><expr> <c-space> coc#refresh()
 inoremap <tab> pumvisible() ? coc#_select_confirm() : "\<C-n>"

 if has('nvim')
     inoremap <silent><expr> <c-space> coc#refresh()
 else
     inoremap <silent><expr> <c-@> coc#refresh()
 endif

 " Use K to show documentation in preview window
  nnoremap <silent> K :call ShowDocumentation()<CR>
 "
 function! ShowDocumentation()
   if CocAction('hasProvider', 'hover')
       call CocActionAsync('doHover')
   else
       call feedkeys('K', 'in')
   endif
 endfunction
"
" Highlight the symbol and its references when holding the
" cursor
 autocmd CursorHold * silent call CocActionAsync('highlight')
"
"" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
 xmap  <leader>a  <Plug>(coc-codeaction-selected)
 nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
 nmap <leader>ac  <Plug>(coc-codeaction-cursor)
 " Remap keys for apply code actions affect whole buffer
 nmap <leader>as  <Plug>(coc-codeaction-source)
 " Apply the most preferred quickfix action to fix diagnostic on the current line
 nmap <leader>qf  <Plug>(coc-fix-current)

 " Remap keys for applying refactor code actions
 nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
 xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
 nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
 nmap <leader>cl  <Plug>(coc-codelens-action)"
