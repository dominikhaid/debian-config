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
    --
    use {"sudormrfbin/cheatsheet.nvim"}
    use {
      "folke/which-key.nvim"
    }
    --
    --LSP
    --use {"ray-x/navigator.lua", requires = {"ray-x/guihua.lua", run = "cd lua/fzy && make"}}
    use "simrat39/symbols-outline.nvim"
    use {"ojroques/nvim-lspfuzzy"}
    --use {"glepnir/lspsaga.nvim"}
    use {"RishabhRD/nvim-lsputils"}
    use "williamboman/nvim-lsp-installer"

    --
    --UI
    use {
      "hoob3rt/lualine.nvim",
      requires = {"kyazdani42/nvim-web-devicons", opt = true}
    }
    use {"kkvh/vim-docker-tools"}
    use {"RishabhRD/popfix"}
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
    -- Flutter
    use {"akinsho/flutter-tools.nvim", requires = "nvim-lua/plenary.nvim"}

    --
    --Snippets
    use {"neovim/nvim-lspconfig"}
    use {"tjdevries/nlua.nvim"}
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-nvim-lua"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-nvim-lsp-document-symbol"
    use "saadparwaiz1/cmp_luasnip"
    use {"tzachar/cmp-tabnine", run = "./install.sh", requires = "hrsh7th/nvim-cmp"}

    use "onsails/lspkind-nvim"

    -- Comparators
    use "lukas-reineke/cmp-under-comparator"

    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
    use "nvim-treesitter/nvim-treesitter-refactor"
    use "nvim-treesitter/nvim-tree-docs"
    use "nvim-treesitter/nvim-treesitter-textobjects"
    use {"mattn/emmet-vim"}
    use {"rafamadriz/friendly-snippets"}
    use {"L3MON4D3/LuaSnip"}
    use {"metakirby5/codi.vim"}
    use "mfussenegger/nvim-jdtls"
    --
    --Git
    -- Packer
    use "sindrets/diffview.nvim"
    --use {"TimUntersberger/neogit", requires = "nvim-lua/plenary.nvim"}
    use {"tpope/vim-fugitive"}
    use {"cljoly/telescope-repo.nvim"}
    use {"tpope/vim-rhubarb"}
    use {"lewis6991/gitsigns.nvim"}
    --
    -- Misc
    --use {"tpope/vim-dispatch"}
    use {"vim-scripts/CSApprox"}
    --use {"xolox/vim-misc"}
    use {"xolox/vim-session"}
    use {
      "ellisonleao/glow.nvim",
      run = "GlowInstall"
    }
    --
    --Rest
    use {
      "NTBBloodbath/rest.nvim",
      requires = {"nvim-lua/plenary.nvim"}
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
    use {"xolox/vim-misc"}
    --
    --Motion
    use {"easymotion/vim-easymotion"}
    use {"tpope/vim-surround"}
  end
)
