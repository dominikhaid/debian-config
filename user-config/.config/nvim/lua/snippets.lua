--local capabilities = vim.lsp.protocol.make_client_capabilities()
--capabilities.textDocument.completion.completionItem.snippetSupport = true

---- Enable the following language servers
--local servers = {"clangd", "rust_analyzer", "pyright", "tsserver"}
--for _, lsp in ipairs(servers) do
--require("lspconfig")[lsp].setup {
---- You will probably want to add a custom on_attach here to locally map keybinds to buffers with an active client
---- on_attach = on_attach,
--capabilities = capabilities
--}
--end

-- Set completeopt to have a better completion experience

vim.o.completeopt = "menuone,noinsert"

require "compe".setup {
  enabled = true,
  autocomplete = true,
  debug = false,
  min_length = 1,
  preselect = "enable",
  throttle_time = 80,
  source_timeout = 200,
  resolve_timeout = 800,
  incomplete_delay = 400,
  max_abbr_width = 100,
  max_kind_width = 100,
  max_menu_width = 100,
  documentation = {
    border = {"", "", "", " ", "", "", "", " "}, -- the border option is the same as `|help nvim_open_win|`
    winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
    max_width = 120,
    min_width = 60,
    max_height = math.floor(vim.o.lines * 0.3),
    min_height = 1
  },
  source = {
    path = true,
    buffer = true,
    calc = true,
    nvim_lsp = true,
    nvim_lua = true,
    vsnip = false,
    ultisnips = false,
    luasnip = true,
    spell = true,
    tabnine = true,
    tags = true,
    snippets_nvim = false,
    treesitter = true
  }
}

-- Utility functions for compe and luasnip
local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
  local col = vim.fn.col "." - 1
  if col == 0 or vim.fn.getline("."):sub(col, col):match "%s" then
    return true
  else
    return false
  end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menu
--- jump to prev/next snippet's placeholder
local luasnip = require "luasnip"
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif luasnip.expand_or_jumpable() then
    return t "<Plug>luasnip-expand-or-jump"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn["compe#complete"]()
  end
end

_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  elseif luasnip.jumpable(-1) then
    return t "<Plug>luasnip-jump-prev"
  else
    return t "<S-Tab>"
  end
end

-- Load snippets from my-snippets folder
require("luasnip/loaders/from_vscode").load(
  {paths = {"$HOME/.local/share/nvim/site/pack/packer/start/friendly-snippets/snippets"}}
)

require("luasnip/loaders/from_vscode").lazy_load()
