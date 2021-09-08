local utils = require("utils")

local cmd = vim.cmd
local indent = 4

vim.api.nvim_command("set encoding=utf-8")
vim.api.nvim_command("set fileencoding=utf-8")
vim.api.nvim_command("set fileencodings=utf-8")
vim.api.nvim_command("set ttyfast")
vim.api.nvim_command("set backspace=indent,eol,start")
vim.g.mapleader = ","
vim.api.nvim_command("set hidden")
vim.api.nvim_command("set hlsearch")
vim.api.nvim_command("set incsearch")
vim.api.nvim_command("set fileformats=unix,dos,mac")
vim.api.nvim_command("set shell=$SHELL")
vim.api.nvim_command("set mouse=a")

vim.g.session_directory = "~/.vim/session"
vim.g.session_autoload = "no"
vim.g.session_autosave = "no"
vim.g.session_command_aliases = 1
vim.no_buffers_menu = 1
vim.g.CSApprox_loaded = 1
vim.g.indentLine_enabled = 1
vim.g.indentLine_concealcursor = 0
vim.g.indentLine_char = "┆"
vim.g.indentLine_faster = 1
vim.g.languagetool_jar = "$HOME/dev/LangugeTool/LanguageTool-5.4/languagetool-commandline.jar"
vim.o.completeopt = "menuone,noselect"

vim.api.nvim_command("set ruler")
vim.api.nvim_command("set smarttab")
vim.api.nvim_command("set cindent")
vim.api.nvim_command("set mousemodel=popup")
vim.api.nvim_command("set t_Co=256")
vim.api.nvim_command("set guioptions=egmrti")
vim.api.nvim_command("set gcr=a:blinkon0")
vim.api.nvim_command("set scrolloff=3")

cmd "syntax enable"
cmd "filetype plugin indent on"
utils.opt("b", "expandtab", true)
utils.opt("b", "shiftwidth", indent)
utils.opt("b", "smartindent", true)
utils.opt("b", "tabstop", indent)
utils.opt("b", "softtabstop", 0)
utils.opt("o", "hidden", true)
utils.opt("o", "ignorecase", true)
utils.opt("o", "scrolloff", 4)
utils.opt("o", "shiftround", true)
utils.opt("o", "smartcase", true)
utils.opt("o", "splitbelow", true)
utils.opt("o", "splitright", true)
utils.opt("o", "wildmode", "list:longest")
utils.opt("w", "number", true)
utils.opt("w", "relativenumber", true)
utils.opt("o", "clipboard", "unnamed,unnamedplus")
vim.g.nvim_tree_disable_netrw = 0
vim.opt.termguicolors = true
vim.g.db_ui_save_location = "~/.config/db_ui"

-- Highlight on yank
vim.cmd "au TextYankPost * lua vim.highlight.on_yank {on_visual = false}"
