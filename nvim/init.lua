-- Set <leader>
vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"

-- Lazy.nvim bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load plugins
require("lazy").setup("plugins")  -- separate file for plugin definitions

-- Basic editor options
vim.opt.number = true
vim.opt.expandtab = true
vim.opt.mouse = ""
vim.opt.compatible = false
vim.cmd("syntax on")
vim.cmd("filetype plugin indent on")
vim.opt.cursorline = true
vim.opt.scrolloff = 2
vim.opt.history = 1000
vim.opt.hlsearch = true
vim.opt.showcmd = true
vim.opt.encoding = "utf-8"
vim.opt.updatetime = 300
vim.opt.signcolumn = "yes"

-- Colorscheme
vim.cmd("colorscheme tokyonight")
vim.opt.guicursor = {
  "n-v-c:block-Cursor",
  "i:ver100-iCursor",
  "n-v-c:blinkon0",
  "i:blinkwait10",
}

-- Terminal escape
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])

-- Tabs
vim.keymap.set("n", "<leader><C-t>", ":tabnew<CR>")
vim.keymap.set("n", "<S-Tab>", ":tabp<CR>")
vim.keymap.set("n", "<Tab>", ":tabn<CR>")
vim.keymap.set("n", "<leader><C-w>", ":tabc<CR>")

-- NERDTree
vim.keymap.set("n", "<leader>n", ":NERDTreeFocus<CR>")
vim.keymap.set("n", "<C-n>", ":NERDTree<CR>")
vim.keymap.set("n", "<C-t>", ":NERDTreeToggle<CR>")
vim.keymap.set("n", "<C-f>", ":NERDTreeFind<CR>")

-- Telescope
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")

-- EasyAlign
vim.api.nvim_set_keymap("x", "ga", "<Plug>(EasyAlign)", {})
vim.api.nvim_set_keymap("n", "ga", "<Plug>(EasyAlign)", {})

-- Airline Clock
vim.g["airline#extensions#clock#format"] = "%a %x %H:%M:%S"
vim.g["airline#extensions#clock#updatetime"] = 1000

-- vim-go
vim.g.go_def_mapping_enabled = 0

-- CoC config — use Vimscript block
vim.cmd([[
" Use <Tab> to navigate completion menu
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Completion trigger
inoremap <silent><expr> <c-space> coc#refresh()

" Show docs
nnoremap <silent> K :call ShowDocumentation()<CR>
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Navigation
nmap <silent><nowait> gd <Plug>(coc-definition)
nmap <silent><nowait> gy <Plug>(coc-type-definition)
nmap <silent><nowait> gi <Plug>(coc-implementation)
nmap <silent><nowait> gr <Plug>(coc-references)

autocmd CursorHold * silent call CocActionAsync('highlight')
autocmd FileType json syntax match Comment +\/\/.\+$+

nmap <leader>rn <Plug>(coc-rename)
xmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>ac <Plug>(coc-codeaction-cursor)
nmap <leader>as <Plug>(coc-codeaction-source)
nmap <leader>qf <Plug>(coc-fix-current)
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r <Plug>(coc-codeaction-refactor-selected)
nmap <leader>cl <Plug>(coc-codelens-action)
]])

-- Copilot
vim.g.copilot_no_tab_map = true
vim.cmd([[
imap <silent><script><expr> <M-j> copilot#Accept("\<CR>")
imap <M-l> <Plug>(copilot-accept-word)
imap <M-J> <Plug>(copilot-accept-line)
]])
