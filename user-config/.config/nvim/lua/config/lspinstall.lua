local function setup_servers()
  require "lspinstall".setup()
  local servers = require "lspinstall".installed_servers()
 local required_server = {
   bash = "bash", 
   css = "css",
   dockerfile="dockerfile",
   go = "go",
   html = "html",
   java = "java",
   json = "json",
   lua = "lua",
   php = "php",
   python = "python",
   rust = "rust",
   tailwindcss = "tailwindcss",
   typescript = "typescript",
   yaml = "yaml",
   graphql = "graphql"}

local function addToSet(set, key)
    set[key] = true
end

local function removeFromSet(set, key)
    set[key] = nil
end

local function setContains(set, key)
    return set[key] ~= nil
end


  for _, server in pairs(servers) do

    if (setContains(required_server, server)) then
      removeFromSet(required_server,server)
    end

    require "lspconfig"[server].setup {
      handlers = {
        ["textDocument/publishDiagnostics"] = vim.lsp.with(
          vim.lsp.diagnostic.on_publish_diagnostics,
          {
            -- disable virtual text
            virtual_text = true,
            -- show signs
            signs = true,
            -- delay update diagnostics
            update_in_insert = false
            -- display_diagnostic_autocmds = { "InsertLeave" },
          }
        )
      }
    }
  end

  for _, serv in pairs(required_server) do
--   require'lspinstall'.install_server(serv)
  end

end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
--require "lspinstall".post_install_hook = function()
  --setup_servers() -- reload installed servers
  --vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
--end
