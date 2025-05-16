set number
set expandtab

tnoremap <Esc> <C-\><C-n>
set mouse=

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
    Plug 'sainnhe/sonokai'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'enricobacis/vim-airline-clock'
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
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'roxma/vim-hug-neovim-rpc'
    Plug 'roxma/nvim-yarp', { 'do': 'pip install -r requirements.txt'  }
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'nvim-lua/plenary.nvim'
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries'  }
    Plug 'charlespascoe/vim-go-syntax'
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install()  }, 'for': ['markdown', 'vim-plug'] }
    Plug 'nvim-treesitter/nvim-treesitter'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  
    Plug 'neovim/nvim-lspconfig'
    Plug 'ray-x/go.nvim'
    Plug 'wadackel/vim-dogrun'
    Plug 'folke/tokyonight.nvim'

call plug#end()

"airline
let g:airline#extensions#clock#format = '%a %x %H:%M:%S'
let g:airline#extensions#clock#updatetime = 1000

"tab control
nnoremap <leader><C-t> :tabnew<CR>
nnoremap <S-tab> :tabp<CR>
nnoremap <tab> :tabn<CR>
nnoremap <leader><C-w> :tabc<CR>

"Colors
colorscheme tokyonight
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

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)coc

" COC
" use tab to navigate through popup menu
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

function! CheckBackspace() abort
    let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction


" Use <c-space> to trigger completion.
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

" GoTo code navigation
nmap <silent><nowait> gd <Plug>(coc-definition)
nmap <silent><nowait> gy <Plug>(coc-type-definition)
nmap <silent><nowait> gi <Plug>(coc-implementation)
nmap <silent><nowait> gr <Plug>(coc-references)
"
autocmd CursorHold * silent call CocActionAsync('highlight')
autocmd FileType json syntax match Comment +\/\/.\+$+

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

" copilot
imap <silent><script><expr> <M-j> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true
imap <M-l> <Plug>(copilot-accept-word)
imap <M-J> <Plug>(copilot-accept-line)

"vim-go
let g:go_def_mapping_enabled=0
