local function setup_servers()
  require "lspinstall".setup()
  local servers = require "lspinstall".installed_servers()


  for _, server in pairs(servers) do


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


end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
--require "lspinstall".post_install_hook = function()
  --setup_servers() -- reload installed servers
  --vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
--end
