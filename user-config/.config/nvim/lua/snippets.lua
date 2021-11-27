local tabnine = require("cmp_tabnine.config")
tabnine:setup(
  {
    max_lines = 1000,
    max_num_results = 20,
    sort = true,
    run_on_every_keystroke = true,
    snippet_placeholder = ".."
  }
)

vim.opt.completeopt = {"menu", "menuone", "noselect"}

-- Don't show the dumb matching stuff.
vim.opt.shortmess:append "c"

local lspkind = require "lspkind"
lspkind.init()

local cmp = require "cmp"

cmp.setup {
  mapping = {
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-e>"] = cmp.mapping.close(),
    ["<c-c>"] = cmp.mapping(
      cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Insert,
        select = true
      },
      {"i", "c"}
    ),
    ["<c-a>"] = cmp.mapping {
      i = cmp.mapping.complete(),
      c = function(_ --[[fallback]])
        if cmp.visible() then
          if not cmp.confirm {select = true} then
            return
          end
        else
          cmp.complete()
        end
      end
    },
    ["<tab>"] = cmp.mapping {
      i = cmp.config.disable,
      c = function(fallback)
        fallback()
      end
    }
    -- Testing
    --["<c-c>"] = cmp.mapping.confirm {
    --behavior = cmp.ConfirmBehavior.Replace,
    --select = true
    --}

    -- If you want tab completion :'(
    --  First you have to just promise to read `:help ins-completion`.
    --
    -- ["<Tab>"] = function(fallback)
    --   if cmp.visible() then
    --     cmp.select_next_item()
    --   else
    --     fallback()
    --   end
    -- end,
    -- ["<S-Tab>"] = function(fallback)
    --   if cmp.visible() then
    --     cmp.select_prev_item()
    --   else
    --     fallback()
    --   end
    -- end,
  },
  -- Youtube:
  --    the order of your sources matter (by default). That gives them priority
  --    you can configure:
  --        keyword_length
  --        priority
  --        max_item_count
  --        (more?)
  sources = {
    {name = "gh_issues"},
    {name = "friendly-snippets"},
    {name = "tn"},
    {name = "cmp_tabnine"},
    {name = "nvim_lua"},
    {name = "zsh"},
    {name = "nvim_lsp"},
    {name = "path"},
    {name = "luasnip"},
    {name = "buffer", keyword_length = 5}
  },
  sorting = {
    comparators = {
      --cmp.config.compare.offset,
      cmp.config.compare.exact,
      --cmp.config.compare.score,
      function(entry1, entry2)
        local _, entry1_under = entry1.completion_item.label:find "^_+"
        local _, entry2_under = entry2.completion_item.label:find "^_+"
        entry1_under = entry1_under or 0
        entry2_under = entry2_under or 0
        if entry1_under > entry2_under then
          return false
        elseif entry1_under < entry2_under then
          return true
        end
      end,
      --cmp.config.compare.kind,
      --cmp.config.compare.sort_text,
      --cmp.config.compare.length,
      cmp.config.compare.order
    }
  },
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end
  },
  formatting = {
    format = lspkind.cmp_format {
      with_text = true,
      menu = {
        luasnip = "[snip]",
        buffer = "[buf]",
        nvim_lsp = "[LSP]",
        nvim_lua = "[api]",
        path = "[path]",
        gh_issues = "[issues]",
        cmp_tabnine = "[TN]"
      }
    }
  },
  experimental = {
    native_menu = false,
    ghost_text = true
  }
}

cmp.setup.cmdline(
  "/",
  {
    completion = {
      autocomplete = false
    },
    sources = cmp.config.sources(
      {
        {name = "nvim_lsp_document_symbol"}
      },
      {}
    )
  }
)

cmp.setup.cmdline(
  ":",
  {
    completion = {
      autocomplete = false
    },
    sources = cmp.config.sources(
      {
        {
          name = "path"
        }
      },
      {
        {
          name = "cmdline",
          max_item_count = 20,
          keyword_length = 4
        }
      }
    )
  }
)

local function prequire(...)
  local status, lib = pcall(require, ...)
  if (status) then
    return lib
  end
  return nil
end

local luasnip = prequire("luasnip")
local cmp = prequire("cmp")

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
  local col = vim.fn.col(".") - 1
  if col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
    return true
  else
    return false
  end
end

_G.tab_complete = function()
  if cmp and cmp.visible() then
    cmp.select_next_item()
  elseif luasnip and luasnip.expand_or_jumpable() then
    return t("<Plug>luasnip-expand-or-jump")
  elseif check_back_space() then
    return t "<Tab>"
  else
    cmp.complete()
  end
  return ""
end
_G.s_tab_complete = function()
  if cmp and cmp.visible() then
    cmp.select_prev_item()
  elseif luasnip and luasnip.jumpable(-1) then
    return t("<Plug>luasnip-jump-prev")
  else
    return t "<S-Tab>"
  end
  return ""
end

--vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
--vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
--vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
--vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
--vim.api.nvim_set_keymap("i", "<C-E>", "<Plug>luasnip-next-choice", {})
--vim.api.nvim_set_keymap("s", "<C-E>", "<Plug>luasnip-next-choice", {})

vim.api.nvim_set_keymap("i", "<c-s>", "<cmd>lua require('luasnip').jump(1)<CR>", {silent = true})
--vim.api.nvim_set_keymap("i", "<c-j>", "<cmd>lua require('luasnip').jump(-1)<CR>", {silent = true})

vim.api.nvim_set_keymap("s", "<c-s>", "<cmd>lua require('luasnip').jump(1)<CR>", {silent = true})
--vim.api.nvim_set_keymap("s", "<c-j>", "<cmd>lua require('luasnip').jump(-1)<CR>", {silent = true})

--vim.cmd [[
--augroup DadbodSql
--au!
--autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer { sources = { { name = 'vim-dadbod-completion' } } }
--augroup END
--]]

--[[
" Disable cmp for a buffer
autocmd FileType TelescopePrompt lua require('cmp').setup.buffer { enabled = false }
--]]
-- Load snippets from my-snippets folder

require("luasnip/loaders/from_vscode").load({paths = {"~/.config/nvim/lua/snippets/snippets"}})

--require("luasnip/loaders/from_vscode").load(
--{paths = {"$HOME/.config/nvim/lua/snippets"}}
--)

require("luasnip/loaders/from_vscode").lazy_load()
