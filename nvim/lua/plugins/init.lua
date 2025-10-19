return {
  -- Color schemes
  { "sainnhe/everforest" },
  { "sainnhe/sonokai" },
  { "junegunn/seoul256.vim" },
  { "wadackel/vim-dogrun" },
  { "folke/tokyonight.nvim" },

  -- Status line & UI
  { "vim-airline/vim-airline" },
  { "vim-airline/vim-airline-themes" },
  { "enricobacis/vim-airline-clock" },
  { "ryanoasis/vim-devicons" },
  { "Yggdroot/indentLine" },
  { "chrisbra/Colorizer" },
  { "KabbAmine/vCoolor.vim" },

  -- Treesitter & LSP
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  { "neovim/nvim-lspconfig" },

  -- Telescope
  { "nvim-lua/plenary.nvim" },
  { "nvim-telescope/telescope.nvim" },

  -- File/Code nav
  { "scrooloose/nerdtree" },
  { "majutsushi/tagbar" },
  { "junegunn/rainbow_parentheses.vim" },

  -- Editing
  { "jiangmiao/auto-pairs" },
  { "tpope/vim-surround" },
  { "tpope/vim-abolish" },
  { "junegunn/vim-easy-align" },
  { "alvan/vim-closetag" },
  { "ervandew/supertab" },
  { "scrooloose/nerdcommenter" },
  { "sheerun/vim-polyglot" },

  -- Writing/Markdown
  { "junegunn/goyo.vim" },
  { "junegunn/limelight.vim" },
  { "junegunn/vim-journal" },
 
  { "vim-scripts/loremipsum" },

  -- Git
  { "tpope/vim-fugitive" },

  -- Completion (COC)
  { "roxma/nvim-yarp", build = "pip install -r requirements.txt" },
  { "roxma/vim-hug-neovim-rpc" },
  { "neoclide/coc.nvim", branch = "release" },

  -- Language support
  { "fatih/vim-go", build = ":GoUpdateBinaries" },
  { "charlespascoe/vim-go-syntax" },
  { "xavierd/clang_complete" },
  { "edwinb/idris2-vim" },
  { "ray-x/go.nvim" },

  -- Copilot
  { "github/copilot.vim" },

  -- DB
  {
  "kndndrj/nvim-dbee",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  build = function()
    -- Install tries to automatically detect the install method.
    -- if it fails, try calling it with one of these parameters:
    --    "curl", "wget", "bitsadmin", "go"
    require("dbee").install()
  end,
  config = function()
    require("dbee").setup()
  end,
}
}

