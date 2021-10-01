require "nvim-treesitter.configs".setup {
  highlight = {
    enable = true,
    disable = {
      "html",
      "php",
      "css"
    },
    additional_vim_regex_highlighting = false
  },
  --tree_docs = {
  --enable = true,
  --spec_config = {
  --jsdoc = {
  --slots = {
  --class = {see = true, author = true}
  --},
  --processors = {
  --author = function()
  --return " * @author Steven Sojka"
  --end,
  --see = function()
  --local ticket = vim.fn.input("Ticket: ")
  --return ticket ~= "" and (" * @see " .. ticket)
  --end
  --}
  --},
  --tsdoc = {
  --slots = {
  --class = {see = true, author = true}
  --},
  --processors = {
  --author = function()
  --return " * @author Steven Sojka"
  --end,
  --see = function()
  --local ticket = vim.fn.input("Ticket: ")
  --return ticket ~= "" and (" * @see " .. ticket)
  --end
  --}
  --}
  --}
  --},
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        ["iF"] = {
          python = "(function_definition) @function",
          cpp = "(function_definition) @function",
          c = "(function_definition) @function",
          java = "(method_declaration) @function"
        }
      }
    },
    swap = {
      enable = true,
      swap_next = {
        ["<leader>a"] = "@parameter.inner"
      },
      swap_previous = {
        ["<leader>A"] = "@parameter.inner"
      }
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer"
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer"
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer"
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer"
      }
    },
    lsp_interop = {
      enable = true,
      border = "none",
      peek_definition_code = {
        ["df"] = "@function.outer",
        ["dF"] = "@class.outer"
      }
    }
  },
  indent = {
    enable = false,
    disable = {}
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm"
    }
  },
  refactor = {
    --highlight_definitions = {enable = true}
    highlight_current_scope = {enable = true}
  },
  ensure_installed = {
    "tsx",
    "json",
    "jsdoc",
    "bash",
    "css",
    "go",
    "javascript",
    "dockerfile",
    "graphql",
    "java",
    "python",
    "dart",
    "lua",
    "rust",
    "typescript",
    "toml",
    "php",
    "json",
    "jsdoc",
    "yaml",
    "html",
    "http",
    "scss"
  }
}
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()

parser_config.tsx.used_by = {"typescript.tsx"}
parser_config.http = {
  install_info = {
    url = "https://github.com/NTBBloodbath/tree-sitter-http",
    files = {"src/parser.c"},
    branch = "main"
  }
}
