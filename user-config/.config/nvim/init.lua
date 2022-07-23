vim.cmd "source $HOME/.config/nvim/vimrc"

local fn = vim.fn
local execute = vim.api.nvim_command

-- Auto install packer.nvim if not exists
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
end

install_path = fn.stdpath("data") .. "/site/pack/packer/start/nvim-lsp-installer"
if fn.empty(fn.glob(install_path)) > 0 then
  execute("!git clone https://github.com/williamboman/nvim-lsp-installer " .. install_path)
end

vim.cmd [[packadd packer.nvim]]
vim.cmd [[packadd nvim-lsp-installer]]
vim.cmd "autocmd BufWritePost plugins.lua PackerCompile" -- Auto compile when there are changes in plugins.lua

-- Install plugins
require("plugins")

install_path = fn.stdpath("data") .. "/site/pack/packer/start/nvim-lspconfig"
if fn.empty(fn.glob(install_path)) == 0 then
  require "themes"

  -- LSP
  require "lsp.init"

  local required_server = {
    "bashls",
    "cssls",
    "dockerls",
    "gopls",
    "eslint",
    "html",
    "jsonls",
    "sumneko_lua",
    "intelephense",
    "pylsp",
    "rust_analyzer",
    "sqls",
    "tsserver",
    "yamlls",
    "graphql"
  }
  local logT = ""

  local servers = require "nvim-lsp-installer.servers".get_installed_server_names()

  local function findInArray(set, key)
    for a, b in pairs(set) do
      if (b == key) then
        table.remove(required_server, a)
        return true
      end
    end
  end

  for i, server in pairs(servers) do
    findInArray(required_server, server)
  end

  local lockPlugs = false

  if table.getn(required_server) > 0 then
    lockPlugs = true
  end

  if lockPlugs == true then
    local langCount = 0
    for i, serv in pairs(required_server) do
      if langCount < 4 then
        require "nvim-lsp-installer".install(serv)
        langCount = langCount + 1
        required_server[i] = nil
      end
    end

    langCount = 0
    for i, serv in pairs(required_server) do
      if langCount < 4 then
        require "nvim-lsp-installer".install(serv)
        langCount = langCount + 1
        required_server[i] = nil
      end
    end
  end

  if lockPlugs == false then
    -- Config
    require("gitsigns").setup()
    require "config"
    require("bufferline").setup {}
    require("telescope").load_extension "file_browser"

    -- Debug
    require "dap.setup"
    require "dap.virtual"
    require "dap.dapui"
    require "dap.go"
    require "dap.java"
    require "dap.javascript"
    require "dap.lua"
    require "dap.php"
    require "dap.python"
    require "dap.rust"
    require "dap.dotnet"

    vim.api.nvim_command("augroup jdtls_lsp")
    vim.api.nvim_command("autocmd!")
    vim.api.nvim_command("autocmd FileType java lua require'jdtls_setup'.setup()")
    vim.api.nvim_command("augroup end")


    -- Key mappings
    require("snippets")

    -- Sensible defaults
    require("settings")

    -- Key mappings
    require("keymappings")

    -- Colors
    require("colors")

    -- Rest
    require("rest-nvim").setup()
    -- Which Key
    require("which-key").setup({})
  end
end
