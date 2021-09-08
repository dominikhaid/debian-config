return require("packer").startup(
  function()
    --
    -- Package Manager
    use {"wbthomason/packer.nvim", opt = false}
    --
    -- Telescope
    use {
      "nvim-telescope/telescope.nvim",
      requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}}
    }
    use {"nvim-telescope/telescope-media-files.nvim"}
    use {"nvim-telescope/telescope-packer.nvim"}
    -- use {"nvim-telescope/telescope-node-modules.nvim"}
    use "dhruvmanila/telescope-bookmarks.nvim"
    use {"ojroques/nvim-lspfuzzy"}
    --
    use {"sudormrfbin/cheatsheet.nvim"}
    use {
      "folke/which-key.nvim",
    }
    --
    --UI
    use {
      "hoob3rt/lualine.nvim",
      requires = {"kyazdani42/nvim-web-devicons", opt = true}
    }
    --use {"ray-x/navigator.lua", requires = {"ray-x/guihua.lua", run = "cd lua/fzy && make"}}
    use "simrat39/symbols-outline.nvim"
    use {"glepnir/lspsaga.nvim"}
    --use {"RishabhRD/nvim-lsputils"}
    use {"kkvh/vim-docker-tools"}
    use {"RishabhRD/popfix"}
    --use {"glepnir/dashboard-nvim"}
    use {"mhinz/vim-startify"}
    use {"liuchengxu/vim-clap"}
    use {"wfxr/minimap.vim", run = ":!cargo install --force code-minimap"}
    use {"voldikss/vim-floaterm"}
    --use {"kyazdani42/nvim-tree.lua"}
    use {"akinsho/nvim-bufferline.lua", requires = "kyazdani42/nvim-web-devicons"}
    use "mfussenegger/nvim-fzy"
    --
    -- Icons
    use {"ryanoasis/vim-devicons"}
    --
    -- Debugging
    use {"simrat39/rust-tools.nvim"}
    use {"rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"}}
    use {"jbyuki/one-small-step-for-vimkind"}
    use {"theHamsta/nvim-dap-virtual-text"}
    use {"nvim-telescope/telescope-dap.nvim"}

    --
    --LSP
    use {"neovim/nvim-lspconfig"}
    use {"tjdevries/nlua.nvim"}
    use {"tzachar/compe-tabnine", requires = "hrsh7th/nvim-compe"}
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
    use {"mattn/emmet-vim"}
    use {"rafamadriz/friendly-snippets"}
    use {"kabouzeid/nvim-lspinstall"}
    use {"L3MON4D3/LuaSnip"}
    use {"hrsh7th/nvim-compe"}
    use {"metakirby5/codi.vim"}
    use "mfussenegger/nvim-jdtls"
    --
    --Git
    -- Packer
    use "sindrets/diffview.nvim"
    use {"TimUntersberger/neogit", requires = "nvim-lua/plenary.nvim"}
    use {"tpope/vim-fugitive"}
    use {"cljoly/telescope-repo.nvim"}
    use {"junegunn/vim-github-dashboard"}
    use {"tpope/vim-rhubarb"}
    use {"airblade/vim-gitgutter"}
    --
    -- Misc
    use {"tpope/vim-dispatch"}
    use {"vim-scripts/CSApprox"}
    use {"xolox/vim-misc"}
    use {"xolox/vim-session"}
    use {
      "ellisonleao/glow.nvim",
      run = "GlowInstall"
    }
    --
    --Rest
    use {
      "NTBBloodbath/rest.nvim",
      requires = {"nvim-lua/plenary.nvim"},
    }

    --
    -- Database
    use {"tpope/vim-dadbod"}
    use {"kristijanhusak/vim-dadbod-ui"}
    --
    --Code
    use {"cohama/lexima.vim"}
    use {"mhartington/formatter.nvim"}
    use {"scrooloose/nerdcommenter"}
    use {"mg979/vim-visual-multi"}
    use {"terryma/vim-expand-region"}
    --
    --Motion
    use {"easymotion/vim-easymotion"}
    use {"tpope/vim-surround"}
    --use {"Raimondi/delimitMate"}
    --use {"junegunn/fzf.vim"}
    --use {'nvim-lua/plenary.nvim'}
    --use {'nvim-lua/popup.nvim'}
    --use {'Shougo/vimproc.vim',opt=false, cmd='g:make'}
    --use {'dpelle/vim-languagetool'}
    --use {'puremourning/vimspector'}
  end
)
