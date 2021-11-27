--local border_chars = {
--TOP_LEFT = "┌",
--TOP_RIGHT = "┐",
--MID_HORIZONTAL = "─",
--MID_VERTICAL = "│",
--BOTTOM_LEFT = "└",
--BOTTOM_RIGHT = "┘"
--}
vim.g.lsp_utils_location_opts = {
  --height = 24,
  --mode = "editor",
  preview = {
    title = "Location Preview",
    border = true,
    border_chars = border_chars
  },
  keymaps = {
    n = {
      ["<C-n>"] = "j",
      ["<C-p>"] = "k"
    }
  },
  prompt = {}
}
vim.g.lsp_utils_symbols_opts = {
  --height = 24,
  --mode = "editor",
  preview = {
    title = "Symbols Preview",
    border = true,
    border_chars = border_chars
  },
  keymaps = {
    n = {
      ["<C-n>"] = "j",
      ["<C-p>"] = "k"
    }
  },
  prompt = {}
}

if vim.fn.has("nvim-0.5.1") == 1 then
  vim.lsp.handlers["textDocument/codeAction"] = require "lsputil.codeAction".code_action_handler
  vim.lsp.handlers["textDocument/references"] = require "lsputil.locations".references_handler
  vim.lsp.handlers["textDocument/definition"] = require "lsputil.locations".definition_handler
  vim.lsp.handlers["textDocument/declaration"] = require "lsputil.locations".declaration_handler
  vim.lsp.handlers["textDocument/typeDefinition"] = require "lsputil.locations".typeDefinition_handler
  vim.lsp.handlers["textDocument/implementation"] = require "lsputil.locations".implementation_handler
  vim.lsp.handlers["textDocument/documentSymbol"] = require "lsputil.symbols".document_handler
  vim.lsp.handlers["workspace/symbol"] = require "lsputil.symbols".workspace_handler
else
  local bufnr = vim.api.nvim_buf_get_number(0)

  vim.lsp.handlers["textDocument/codeAction"] = function(_, _, actions)
    require("lsputil.codeAction").code_action_handler(nil, actions, nil, nil, nil)
  end

  vim.lsp.handlers["textDocument/references"] = function(_, _, result)
    require("lsputil.locations").references_handler(nil, result, {bufnr = bufnr}, nil)
  end

  vim.lsp.handlers["textDocument/definition"] = function(_, method, result)
    require("lsputil.locations").definition_handler(nil, result, {bufnr = bufnr, method = method}, nil)
  end

  vim.lsp.handlers["textDocument/declaration"] = function(_, method, result)
    require("lsputil.locations").declaration_handler(nil, result, {bufnr = bufnr, method = method}, nil)
  end

  vim.lsp.handlers["textDocument/typeDefinition"] = function(_, method, result)
    require("lsputil.locations").typeDefinition_handler(nil, result, {bufnr = bufnr, method = method}, nil)
  end

  vim.lsp.handlers["textDocument/implementation"] = function(_, method, result)
    require("lsputil.locations").implementation_handler(nil, result, {bufnr = bufnr, method = method}, nil)
  end

  vim.lsp.handlers["textDocument/documentSymbol"] = function(_, _, result, _, bufn)
    require("lsputil.symbols").document_handler(nil, result, {bufnr = bufn}, nil)
  end

  vim.lsp.handlers["textDocument/symbol"] = function(_, _, result, _, bufn)
    require("lsputil.symbols").workspace_handler(nil, result, {bufnr = bufn}, nil)
  end
end

local opts = {noremap = true, silent = true}
-- LSP Native
vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
vim.api.nvim_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
vim.api.nvim_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
vim.api.nvim_set_keymap("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
vim.api.nvim_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
vim.api.nvim_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
vim.api.nvim_set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
vim.api.nvim_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
vim.api.nvim_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
vim.api.nvim_set_keymap("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
vim.api.nvim_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
vim.api.nvim_set_keymap("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
vim.api.nvim_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
vim.api.nvim_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
vim.api.nvim_set_keymap("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
vim.api.nvim_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
vim.api.nvim_set_keymap("n", "g0", "<cmd>:SymbolsOutline<CR>", opts)
--vim.api.nvim_set_keymap("n", "g0", "<cmd>:Telescope lsp_document_symbols<CR>", opts)
