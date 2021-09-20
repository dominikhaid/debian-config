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
  indent = {
    enable = false,
    disable = {}
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
    "yaml",
    "html",
    "scss"
  }
}
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()

parser_config.tsx.used_by = {"typescript.tsx"}
