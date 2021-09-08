vim.cmd "source $HOME/.config/nvim/vimrc"

local fn = vim.fn
local execute = vim.api.nvim_command
local home = os.getenv("HOME")

-- Auto install packer.nvim if not exists
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
end

install_path = fn.stdpath("data") .. "/site/pack/packer/start/nvim-lspinstall"
if fn.empty(fn.glob(install_path)) > 0 then
  execute("!git clone https://github.com/kabouzeid/nvim-lspinstall " .. install_path)
end

vim.cmd [[packadd packer.nvim]]
vim.cmd [[packadd nvim-lspinstall]]
vim.cmd "autocmd BufWritePost plugins.lua PackerCompile" -- Auto compile when there are changes in plugins.lua

-- Install plugins
require("plugins")

install_path = fn.stdpath("data") .. "/site/pack/packer/start/nvim-lspconfig"
if fn.empty(fn.glob(install_path)) == 0 then
  require "themes"

  -- LSP
  require "lsp"

  local required_server = {
    "bash",
    "css",
    "dockerfile",
    "go",
    "html",
    "java",
    "json",
    "lua",
    "php",
    "python",
    "rust",
    "tailwindcss",
    "typescript",
    "yaml",
    "graphql"
  }

  local servers = require "lspinstall".installed_servers()

  local function isEmpty(s)
    return s == nil or s == ""
  end

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
        require "lspinstall".install_server(serv)
        langCount = langCount + 1
        required_server[i] = nil
      end
    end

    langCount = 0
    for i, serv in pairs(required_server) do
      if langCount < 4 then
        require "lspinstall".install_server(serv)
        langCount = langCount + 1
        required_server[i] = nil
      end
    end
  end

  if lockPlugs == false then
    -- Config
    require "config"

    require("bufferline").setup {}

    vim.api.nvim_command("augroup lsp")
    vim.api.nvim_command("au!")
    vim.api.nvim_command("au FileType java lua require('jdtls').start_or_attach({cmd = {'java-lsp.sh'}})")
    vim.api.nvim_command("augroup end")

    -- Debug
    require "dap.init"

    vim.api.nvim_command("augroup jdtls_lsp")
    vim.api.nvim_command("autocmd!")
    vim.api.nvim_command("autocmd FileType java lua require'jdtls_setup'.setup()")
    vim.api.nvim_command("augroup end")

    require "telescope".load_extension "repo"
    require("telescope").load_extension("bookmarks")
    require("telescope").load_extension("media_files")

    -- Key mappings
    require("snippets")

    -- Sensible defaults
    require("settings")

    -- Key mappings
    require("keymappings")

    -- Colors
    require("colors")

    -- Rest
    require("rest-nvim").setup({result_split_horizontal = false, skip_ssl_verification = false})

    -- Which Key
    require("which-key").setup({})
  end
end
