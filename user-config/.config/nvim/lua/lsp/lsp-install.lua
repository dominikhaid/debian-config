local function setup_servers()
  require "lspinstall".setup()
  local servers = require "lspinstall".installed_servers()

  for _, server in pairs(servers) do
    require "lspconfig"[server].setup {
      handlers = {
        ["textDocument/publishDiagnostics"] = vim.lsp.with(
          vim.lsp.diagnostic.on_publish_diagnostics,
          {
            virtual_text = true,
            signs = true,
            update_in_insert = false
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

local signs = {Error = " ", Warning = " ", Hint = " ", Information = " "}

for type, icon in pairs(signs) do
  local hl = "LspDiagnosticsSign" .. type
  vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = ""})
end

-- You will likely want to reduce updatetime which affects CursorHold
-- note: this setting is global and should be set only once
vim.o.updatetime = 250
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.lsp.diagnostic.show_line_diagnostics({focusable=false})]]
